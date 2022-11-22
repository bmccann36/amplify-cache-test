

ls node_modules

PREV_HASH=$(envCache --get packageLockSha)
CURR_HASH="$(sha1sum package-lock.json | cut -d " " -f 1 )"


if [ "$PREV_HASH" = "$CURR_HASH" ]; then
  echo "package-lock has not changed since last build"
fi


envCache --set packageLockSha $CURR_HASH
