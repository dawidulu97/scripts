import never from 'never'
import Jimp from 'jimp'
import path from 'path'

interface Context {
  token: string
  event: {
    issue: {
      body: string
    }
  }
}

void (async () => {
  const context = JSON.parse(process.env.GITHUB_CONTEXT as string) as Context

  const { body } = context.event.issue

  console.log(body)

  const bodyLines = body.split('\n')

  console.log(bodyLines)

  const boardName = bodyLines[2]

  console.log(`Board name: ${boardName}`)

  const logoMarkdown = bodyLines[6]

  const imageUrlRegex = /!\[.*\]\((.*)\)/g
  const match = (imageUrlRegex.exec(logoMarkdown))?.[1] ?? never('Invalid markdown logo')

  console.log(`Parsed logo URL: ${match}`)
  const logo = await Jimp.read(match)
  console.log(`Original logo: ${logo.getWidth()}x${logo.getHeight()} (${logo.getExtension()})`)

  const maxSize = 250
  let scaledLogo: Jimp
  if (logo.getWidth() > maxSize || logo.getHeight() > maxSize) {
    console.log(`Resizing logo to a maximum of ${maxSize}x${maxSize}`)
    scaledLogo = logo.scaleToFit(maxSize, maxSize)
    console.log(`New logo size: ${scaledLogo.getWidth()}x${scaledLogo.getHeight()}`)
  } else {
    console.log(`Logo is within ${maxSize}x${maxSize}. Not resizing`)
    scaledLogo = logo
  }

  console.log('Saving logo to Documentation/coreboot_logo.bmp in coreboot folder')
  await scaledLogo.writeAsync(path.join(__dirname, '../coreboot/Documentation/coreboot_logo.bmp'))
})()
