
echo 'contents of node_modules: '
ls node_modules

PREV_HASH=$(envCache --get packageLockSha)
# calculate hash of package-lock.json file so we can know if it has changed
CURR_HASH="$(sha1sum package-lock.json | cut -d " " -f 1 )"

if [ "$PREV_HASH" = "$CURR_HASH" ]; then
  echo "---------------------------------------------------------"
  echo "** PACKAGE-LOCK.JSON FILE NOT CHANGED SINCE LAST BUILD **"
  echo "---------------------------------------------------------"
  export SHOULD_NPM_INSTALL=0
else
  echo "------------------------------------------------------------"
  echo "** PACKAGE-LOCK.JSON CHANGE DETECTED WILL RUN NPM INSTALL **"
  echo "------------------------------------------------------------"
  export SHOULD_NPM_INSTALL=1
fi
# store package-lock hash for next run
envCache --set packageLockSha "$CURR_HASH"
