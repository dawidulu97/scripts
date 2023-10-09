import never from 'never'
import Jimp from 'jimp'
import path from 'path'
import fs from 'fs/promises'
import { convert as svgToPng } from 'convert-svg-to-png'

interface Context {
  token: string
  event: {
    issue: {
      body: string
    }
  }
}

void (async () => {
  console.log(process.env.GITHUB_CONTEXT)
  const context = JSON.parse(process.env.GITHUB_CONTEXT as string) as Context

  const { body } = context.event.issue

  console.log(body)

  const bodyLines = body.split('\n')

  console.log(bodyLines)

  const boardName = bodyLines[2].trim().toLowerCase()

  console.log(`Board name: ${boardName}`)

  await fs.writeFile(process.env.GITHUB_OUTPUT as string, `boardName=${boardName}`, 'utf8')

  const logoMarkdown = bodyLines[6]

  const imageUrlRegex = /!\[.*\]\((.*)\)/g
  const match = (imageUrlRegex.exec(logoMarkdown))?.[1] ?? never('Invalid markdown logo')

  console.log(`Parsed logo URL: ${match}`)

  const r = await fetch(match)
  const contentType = r.headers.get('Content-Type')

  const blob = await r.blob()
  const logoBuffer = Buffer.from(await blob.arrayBuffer())
  const maxSize = 250

  let scaledLogo: Jimp
  if (contentType === 'image/svg+xml') {
    console.log('Detected SVG logo. Creating a 250x250 PNG logo from the SVG logo')
    const pngBuffer = await svgToPng(logoBuffer, {
      width: maxSize,
      height: maxSize
    })
    scaledLogo = await Jimp.create(pngBuffer)
    // logo.write(path.join(__dirname, 'test.png'))
  } else {
    const logo = await Jimp.create(logoBuffer)
    console.log(`Original logo: ${logo.getWidth()}x${logo.getHeight()} (${logo.getExtension()})`)
    if (logo.getWidth() > maxSize || logo.getHeight() > maxSize) {
      console.log(`Resizing logo to a maximum of ${maxSize}x${maxSize}`)
      scaledLogo = logo.scaleToFit(maxSize, maxSize)
      console.log(`New logo size: ${scaledLogo.getWidth()}x${scaledLogo.getHeight()}`)
    } else {
      console.log(`Logo is within ${maxSize}x${maxSize}. Not resizing`)
      scaledLogo = logo
    }
  }

  console.log('Saving logo to Documentation/coreboot_logo.bmp in coreboot folder', path.join(__dirname, '../coreboot/Documentation/coreboot_logo.bmp'))
  await scaledLogo.writeAsync(path.join(__dirname, '../coreboot/Documentation/coreboot_logo.bmp'))
})()
