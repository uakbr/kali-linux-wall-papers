#!/usr/bin/env sh

set -e

rm -rf */backgrounds/kali-16x9/

## 1920x1200 is old 16x9. 1920x1080 is the way forwards. However, prefer 16x9. Because of this, don't sort the ordering
for image in */backgrounds/*/*-1920x1200.* */backgrounds/*/*-1920x1080.* */backgrounds/*/*-16x9.*
do
    symlinks_dir="$(dirname "$image")/../kali-16x9/"
    mkdir -p $symlinks_dir/
    ln -rsfv "$image" "${symlinks_dir}$(basename "$image" | sed 's/-[[:digit:]]\+x[[:digit:]]\+//')"
done
