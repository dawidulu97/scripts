const never = (msg: string): never => { throw new Error(msg) }
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

  const boardDropdownValue = trimmedNonEmptyLines[3]
  const boardManualValue = trimmedNonEmptyLines[5]
  let boardName: string
  if (boardDropdownValue.startsWith('None')) {
    boardName = boardManualValue.toLowerCase()
  } else {
    // Extract first part (e.g., 'jinlon' from 'jinlon - HP Elite c1030')
    boardName = boardDropdownValue.split(' - ')[0].toLowerCase().trim()
  }

  const logoMarkdown = trimmedNonEmptyLines[7]
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
  const DISABLE_HECI1_AT_PRE_BOOT = yesNoMap.get(trimmedNonEmptyLines[9])

  const EDK2_FULL_SCREEN_SETUP = yesNoMap.get(trimmedNonEmptyLines[11])

  const EDK2_BOOT_MANAGER_ESCAPE = yesNoMap.get(trimmedNonEmptyLines[13])

  const EDK2_BOOT_TIMEOUT = trimmedNonEmptyLines[15]?.length > 0 ? parseFloat(trimmedNonEmptyLines[15]) : undefined

  const UNHIDE_BIOMETRIC = yesNoMap.get(trimmedNonEmptyLines[17])

  return {
    firmwareType,
    boardName,
    logo,
    DISABLE_HECI1_AT_PRE_BOOT,
    EDK2_FULL_SCREEN_SETUP,
    EDK2_BOOT_MANAGER_ESCAPE,
    EDK2_BOOT_TIMEOUT,
    unhideBiometric: UNHIDE_BIOMETRIC
  }
}

export default parseInputs
