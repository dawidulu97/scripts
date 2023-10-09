import never from 'never'
import type Inputs from './Inputs'

const parseInputs = (issueBody: string): Inputs => {
  const bodyLines = issueBody.split('\n')

  console.log('Issue body lines:', bodyLines)

  const trimmedNonEmptyLines = bodyLines
    .map(line => line.trim())
    .filter(line => line.length > 0)

  console.log('Trimmed non-empty lines:', trimmedNonEmptyLines)

  const boardName = trimmedNonEmptyLines[1].toLowerCase()

  const logoMarkdown = trimmedNonEmptyLines[3]
  let logo: string | undefined
  if (logoMarkdown !== '_No response_') {
    const imageUrlRegex = /!\[.*\]\((.*)\)/g
    logo = (imageUrlRegex.exec(logoMarkdown))?.[1] ?? never('Invalid markdown logo')
  } else {
    logo = undefined
  }

  const DISABLE_HECI1_AT_PRE_BOOT = new Map<string, boolean | undefined>([
    ['None', undefined],
    ['No', false],
    ['Yes', true]
  ]).get(trimmedNonEmptyLines[5])

  return {
    boardName,
    logo,
    DISABLE_HECI1_AT_PRE_BOOT
  }
}

export default parseInputs
