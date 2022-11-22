

ls node_modules
echo $(envCache --get packageLockSha)
export PACKAGE_LOCK_SHA1="$(sha1sum package-lock.json | cut -d " " -f 1 )"
envCache --set packageLockSha $PACKAGE_LOCK_SHA1
