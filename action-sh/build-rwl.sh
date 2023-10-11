#!/bin/bash
source ./sources.sh

# This is an ugly mess that works. It was copyd from the mrchromebox script.
snb_ivb=('butterfly' 'link' 'lumpy' 'parrot' 'stout' 'stumpy')
hsw_boxes=('mccloud' 'panther' 'tricky' 'zako')
hsw_books=('falco' 'leon' 'monroe' 'peppy' 'wolf')
bdw_boxes=('guado' 'rikku' 'tidus')
bdw_books=('auron_paine' 'auron_yuna' 'buddy' 'gandof' 'lulu' 'samus')
baytrail=('banjo' 'candy' 'clapper' 'enguarde' 'glimmer' 'gnawty' 'heli'
    'kip' 'ninja' 'orco' 'quawks' 'squawks' 'sumo' 'swanky' 'winky')
braswell=('banon' 'celes' 'cyan' 'edgar' 'kefka' 'reks' 'relm'
    'setzer' 'terra' 'ultima' 'wizpig')
skylake=('asuka' 'caroline' 'cave' 'chell' 'lars' 'lili' 'sentry')
apl=('astronaut' 'babymega' 'babytiger' 'blacktip' 'blue' 'bruce' 'coral'
    'electro' 'epaulette' 'lava' 'nasher' 'nasher360' 'pyro' 'rabbid' 'reef'
    'robo' 'robo360' 'sand' 'santa' 'snappy' 'whitetip')
kbl_boxes=('bleemo' 'endeavour' 'excelsior' 'fizz' 'jax' 'kench' 'sion' 'teemo' 'wukong')
kbl_rwl_20=('akali' 'bard' 'ekko' 'eve' 'nami' 'nautilus'
    'pantheon' 'sona' 'soraka' 'syndra' 'vayne')
kbl_rwl_18=('atlas' 'karma' 'leona' 'nocturne' 'rammus' 'shyvana')
kbl=($(printf "%s " "${kbl_boxes[@]}" "${kbl_rwl_20[@]}" "${kbl_rwl_18[@]}"))
glk=('ampton' 'apel' 'apele' 'bloog' 'blooglet' 'blooguard' 'blorb' 'bluebird' 'bobba'
    'bobba360' 'casta' 'dood' 'droid' 'dorp' 'fleex' 'foob' 'foob360' 'garg'
    'garg360' 'garfour' 'glk' 'glk360' 'grabbiter' 'laser' 'laser14' 'lick'
    'meep' 'mimrock' 'nospike' 'octopus' 'orbatrix' 'phaser' 'phaser360'
    'phaser360s' 'sparky' 'sparky360' 'vorticon' 'vortininja')
whl=('arcada' 'sarien')
cml_boxes=('ambassador' 'dooly' 'duffy' 'faffy' 'kaisa' 'noibat' 'puff' 'wyvern')
cml_books=('akemi' 'dragonair' 'drallion' 'dratini' 'hatch' 'helios' 'jinlon' 'kindred' 'kled'
    'kohaku' 'nightfury')
cml=($(printf "%s " "${cml_boxes[@]}" "${cml_books[@]}"))
jsl=('beetley' 'blipper' 'bookem' 'boten' 'botenflex' 'bugzzy' 'cret' 'cret360'
    'drawcia' 'drawlat' 'drawman' 'drawper' 'galith' 'galith360' 'gallop' 'galnat' 'galnat360'
    'galtic' 'galtic360' 'kracko' 'kracko360' 'landia' 'landrid' 'lantis' 'madoo' 'magister'
    'maglet' 'maglia' 'maglith' 'magma' 'magneto' 'magolor' 'magpie' 'metaknight' 'pasara'
    'pirette' 'pirika' 'sasuke' 'storo' 'storo360')
tgl=('chronicler' 'collis' 'copano' 'delbin' 'drobit' 'eldrid' 'elemi' 'lillipup' 'lindar'
    'voema' 'volet' 'volta' 'voxel')
adl=('anahera' 'brya' 'banshee' 'kano' 'crota' 'crota360' 'felwinter' 'gimble' 'mithrax'
    'osiris' 'primus' 'redrix' 'taeko' 'taniks' 'volmar' 'zavala'
    'constitution' 'gladios' 'kinox' 'kuldax' 'lisbon' 'moli')
adl_n=('craask' 'craaskbowl' 'craaskvin' 'craasneto' 'joxer' 'joxero' 'nereid' 'nirwin' 'nivviks'
    'pujjo' 'pujjoflex' 'pujjoteen' 'pujjoteen15w' 'xivu' 'xivu360' 'yaviks' 'yavikso')

str=('aleena' 'barla' 'careena' 'grunt' 'kasumi' 'liara' 'treeya' 'treeya360')
pco=('berknip' 'dirinboz' 'ezkinil' 'gumboz' 'jelboz360' 'morphius' 'vilboz' 'woomax')
czn=('dewatt' 'guybrush' 'nipperkin')
mdn=('crystaldrift' 'frostflow' 'markarth' 'skyrim' 'whiterun')

[[ "${hsw_boxes[@]}" =~ "$BOARD_NAME" ]] && isHswBox=true
[[ "${hsw_books[@]}" =~ "$BOARD_NAME" ]] && isHswBook=true
[[ "$isHswBox" = true || "$isHswBook" = true ]] && isHsw=true
[[ "${bdw_boxes[@]}" =~ "$BOARD_NAME" ]] && isBdwBox=true
[[ "${bdw_books[@]}" =~ "$BOARD_NAME" ]] && isBdwBook=true
[[ "$isBdwBox" = true || "$isBdwBook" = true ]] && isBdw=true
[[ "${baytrail[@]}" =~ "$BOARD_NAME" ]] && isByt=true
[[ "${braswell[@]}" =~ "$BOARD_NAME" ]] && isBsw=true
[[ "${skylake[@]}" =~ "$BOARD_NAME" ]] && isSkl=true
[[ "${snb_ivb[@]}" =~ "$BOARD_NAME" ]] && isSnbIvb=true
[[ "${apl[@]}" =~ "$BOARD_NAME" ]] && isApl=true
[[ "${kbl_rwl_18[@]}" =~ "$BOARD_NAME" ]] && kbl_use_rwl18=true
[[ "${kbl[@]}" =~ "$BOARD_NAME" ]] && isKbl=true
[[ "${glk[@]}" =~ "$BOARD_NAME" ]] && isGlk=true
[[ "${str[@]}" =~ "$BOARD_NAME" ]] && isStr=true
[[ "${whl[@]}" =~ "$BOARD_NAME" ]] && isWhl=true
[[ "${cml[@]}" =~ "$BOARD_NAME" ]] && isCml=true
[[ "${pco[@]}" =~ "$BOARD_NAME" ]] && isPco=true
[[ "${czn[@]}" =~ "$BOARD_NAME" ]] && isCzn=true
[[ "${mdn[@]}" =~ "$BOARD_NAME" ]] && isMdn=true
[[ "${jsl[@]}" =~ "$BOARD_NAME" ]] && isJsl=true
[[ "${tgl[@]}" =~ "$BOARD_NAME" ]] && isTgl=true
[[ "${adl[@]}" =~ "$BOARD_NAME" ]] && isAdl=true
[[ "${adl_n[@]}" =~ "$BOARD_NAME" ]] && isAdlN=true
[[ "${cml_boxes[@]}" =~ "$BOARD_NAME" ]] && isCmlBox=true

if [[ 
    "$BOARD_NAME" = "link" ||
    "$isHswBox" = true ||
    "$isBdwBox" = true ||
    "$isHswBook" = true || "$isBdwBook" = true ||
    "$isByt" = true ||
    "$isBsw" = true ||
    "$isSkl" = true ||
    "$isApl" = true ||
    "$isKbl" = true ]] \
    ; then
    echo "This device uses SeaBIOS, and SeaBIOS does not use coreboot! Cannot customize RW_LEGACY for this device!"
    exit 1
elif [ "$isWhl" = true ]; then
    rwlegacy_file=$rwl_altfw_whl
elif [ "$device" = "drallion" ]; then
    rwlegacy_file=$rwl_altfw_drallion
elif [ "$isCmlBox" = true ]; then
    rwlegacy_file=$rwl_altfw_cml
elif [ "$isJsl" = true ]; then
    rwlegacy_file=$rwl_altfw_jsl
elif [ "$isTgl" = true ]; then
    rwlegacy_file=$rwl_altfw_tgl
elif [ "$isGlk" = true ]; then
    rwlegacy_file=$rwl_altfw_glk
elif [ "$isAdl" = true ]; then
    rwlegacy_file=$rwl_altfw_adl
elif [ "$isAdlN" = true ]; then
    # rwlegacy_file=$rwl_altfw_adl_n
    echo "Idk which cbfstool to use for Alderlake-N"
    exit 1
elif [ "$isStr" = true ]; then
    rwlegacy_file=$rwl_altfw_stoney
elif [ "$isPco" = true ]; then
    rwlegacy_file=$rwl_altfw_pco
elif [ "$isCzn" = true ]; then
    rwlegacy_file=$rwl_altfw_czn
elif [ "$isMdn" = true ]; then
    rwlegacy_file=$rwl_altfw_mdn
else
    echo "Unknown RW_LEGACY file. Make sure the device you are building for supports RW_LEGACY."
    exit 1
fi

PROJECT_DIR=$(pwd)

cd coreboot
echo "CONFIG_BOARD_EMULATION_QEMU_X86_Q35=y" >>.config
make clean || exit 1
make olddefconfig || exit 1
echo "*** .config ***"
cat .config
echo "*** end of .config ***"
make -j$(nproc) || exit 1

rwlegacy_file_without_extension=${rwlegacy_file%%.*}

echo "Downloading RW_LEGACY from $rwlegacy_source$rwlegacy_file"
TMP=$(mktemp -d)
cd $TMP
curl -sLO ${rwlegacy_source}${rwlegacy_file}.md5 || exit 1
curl -sLO ${rwlegacy_source}${rwlegacy_file} || exit 1
if ! md5sum -c "${rwlegacy_file}.md5" --quiet 2>/dev/null; then
    echo "RW_LEGACY download checksum fail; download corrupted"
    exit 1
fi
rm $TMP/${rwlegacy_file}.md5
BUILD_FILE_NAME=$rwlegacy_file_without_extension-customized-$ISSUE_NUMBER
CUSTOMIZED_RWL_FILE=$BUILD_FILE_NAME.bin
mv $TMP/${rwlegacy_file} $TMP/$CUSTOMIZED_RWL_FILE

if [[ "$isAdl" = true ]]; then
    echo "Using Alderlake cbfstool"
    cbfstool=$PROJECT_DIR/action-sh/cbfstool-adl
else
    echo "Using cbfstool built with coreboot"
    cbfstool=$PROJECT_DIR/coreboot/build/cbfstool
fi

# FIXME: Some devices may not have something called "edk2" it might be called "tianocore" I'm not sure
echo "Removing payload"
$cbfstool $TMP/$CUSTOMIZED_RWL_FILE remove -n altfw/edk2 || exit 1

echo "Adding custom payload"
$cbfstool $TMP/$CUSTOMIZED_RWL_FILE add-payload -n altfw/edk2 -f $PROJECT_DIR/coreboot/build/UEFIPAYLOAD.fd -c LZMA || exit 1

echo "Creating sha1"
sha1sum $CUSTOMIZED_RWL_FILE >$CUSTOMIZED_RWL_FILE.sha1 || exit 1

cp $PROJECT_DIR/action-sh/flash-rwl.sh $TMP
cp $PROJECT_DIR/action-sh/flashrom $TMP
echo $BUILD_FILE_NAME >$TMP/BUILD_FILE_NAME

TMP2=$(mktemp -d)
echo "Creating .tar.gz file"
tar -czvf $TMP2/$BUILD_FILE_NAME.tar.gz . || exit 1
echo artifactName=$BUILD_FILE_NAME.tar.gz >>$GITHUB_OUTPUT
echo artifactPath=$TMP2/$BUILD_FILE_NAME.tar.gz >>$GITHUB_OUTPUT
