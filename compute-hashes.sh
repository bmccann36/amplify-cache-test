
echo 'contents of node_modules: '
ls node_modules

PREV_HASH=$(envCache --get packageLockSha)
CURR_HASH="$(sha1sum package-lock.json | cut -d " " -f 1 )"


if [ "$PREV_HASH" = "$CURR_HASH" ]; then
  printf "\n ** package-lock has not changed since last build ** \n"
  export SHOULD_NPM_INSTALL=true
else
  export SHOULD_NPM_INSTALL=false
fi


envCache --set packageLockSha "$CURR_HASH"
