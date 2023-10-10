#!/bin/bash
cd coreboot
cat $(find ./configs -name "config.$BOARD_NAME.uefi") >>.config
echo "CONFIG_LOCALVERSION=\"$(git describe --tags --dirty)\"" >>.config
make clean
make olddefconfig
echo "*** .config ***"
cat .config
echo "*** end of .config ***"
make -j$(nproc)
cd ..
TMP=$(mktemp -d)
BUILD_FILE_NAME=$BOARD_NAME-full-rom-custom-logo-$ISSUE_NUMBER
cp coreboot/build/coreboot.rom $TMP/$BUILD_FILE_NAME.rom
cp action-sh/flash-full-rom.sh $TMP
cp action-sh/flashrom $TMP
TMP2=$(mktemp -d)
cd $TMP
echo $BUILD_FILE_NAME >BUILD_FILE_NAME
sha1sum $BUILD_FILE_NAME.rom >$BUILD_FILE_NAME.rom.sha1
tar -czvf $TMP2/$BUILD_FILE_NAME.tar.gz .
echo artifactPath=$TMP2/$BUILD_FILE_NAME.tar.gz >>$GITHUB_OUTPUT
