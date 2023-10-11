import type FirmwareType from './FirmwareType'

interface Inputs {
  firmwareType: FirmwareType
  boardName: string
  logo?: string
  DISABLE_HECI1_AT_PRE_BOOT?: boolean
  EDK2_FULL_SCREEN_SETUP?: boolean
  EDK2_BOOT_MANAGER_ESCAPE?: boolean
  EDK2_BOOT_TIMEOUT?: number
}

export default Inputs
