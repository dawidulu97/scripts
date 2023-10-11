import never from 'never'
import type Inputs from './Inputs'
import FirmwareType from './FirmwareType'

const parseInputs = (issueBody: string): Inputs => {
  const bodyLines = issueBody.split('\n')

  console.log('Issue body lines:', bodyLines)

  const trimmedNonEmptyLines = bodyLines
    .map(line => line.trim())
    .filter(line => line.length > 0)

  console.log('Trimmed non-empty lines:', trimmedNonEmptyLines)

  const firmwareType = new Map<string, FirmwareType>([
    ['Full ROM', FirmwareType.FULL_ROM],
    ['Alt FW', FirmwareType.ALT_FW]
  ]).get(trimmedNonEmptyLines[1]) ?? never('Invalid firmware type')

  const boardName = trimmedNonEmptyLines[3].toLowerCase()

  const logoMarkdown = trimmedNonEmptyLines[5]
  let logo: string | undefined
  if (logoMarkdown !== '_No response_') {
    const imageUrlRegex = /!\[.*\]\((.*)\)/g
    logo = (imageUrlRegex.exec(logoMarkdown))?.[1] ?? never('Invalid markdown logo')
  } else {
    logo = undefined
  }

  const yesNoMap = new Map<string, boolean | undefined>([
    ['None', undefined],
    ['No', false],
    ['Yes', true]
  ])
  const DISABLE_HECI1_AT_PRE_BOOT = yesNoMap.get(trimmedNonEmptyLines[7])

  const EDK2_FULL_SCREEN_SETUP = yesNoMap.get(trimmedNonEmptyLines[9])

  const EDK2_BOOT_MANAGER_ESCAPE = yesNoMap.get(trimmedNonEmptyLines[11])

  const EDK2_BOOT_TIMEOUT = trimmedNonEmptyLines[13]?.length > 0 ? parseFloat(trimmedNonEmptyLines[13]) : undefined

  return {
    firmwareType,
    boardName,
    logo,
    DISABLE_HECI1_AT_PRE_BOOT,
    EDK2_FULL_SCREEN_SETUP,
    EDK2_BOOT_MANAGER_ESCAPE,
    EDK2_BOOT_TIMEOUT
  }
}

export default parseInputs
