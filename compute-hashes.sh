PACKAGE_LOCK_SHA1="$(sha1sum package-lock.json | cut -d " " -f 1 )"

echo $PACKAGE_LOCK_SHA1
