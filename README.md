# Automated building of Full ROM and Alt FW (edk2) for Chromebooks with a custom logo
## Prerequisites
- Find your model number
- Have a logo image file which can be uploaded to GitHub issues (`.png` and `.jpg` work)

## Instructions
1. Click create a new issue. 
2. Choose the correct template. 
3. Enter the board name. 
4. Replace the template image with the logo you want.
5. Create the issue.
6. Wait for a comment from GitHub Actions about the status of your build
7. If the build succeeds, download the artifact and use `flashrom` to flash full ROM to your Chromebook. If you are on Linux, you can download [`flashrom` here](http://tree123.org/chrultrabook/utils/flashrom-weirdtreething).
8. If the build fails, check the logs. You can try the build again by re-opening the issue. Create an issue with a bug report if needed.

## Feature requests
If you want another feature (such as more options to build coreboot with) open an issue without using the build template.
