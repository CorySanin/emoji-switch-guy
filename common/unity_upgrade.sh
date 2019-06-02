# Things that ONLY run during an upgrade - you probably won't need this
# A use for this would be to back up app data before it's wiped if your module includes an app
# NOTE: the normal upgrade process is just an uninstall followed by an install
mkdir -p ${MODPATH}
cp -f "${MODPATH}/../../modules/${MODID}/font.txt" "${TMPDIR}/font.txt"

if [ -e $TMPDIR/font.txt ]; then
    rm -rf "${TMPDIR}/addon/Volume-Key-Selector"
fi
