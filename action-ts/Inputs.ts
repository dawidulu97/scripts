import type FirmwareType from './FirmwareType'

interface Inputs {
  firmwareType: FirmwareType
  boardName: string
  logo?: string
  DISABLE_HECI1_AT_PRE_BOOT?: boolean
}

export default Inputs
