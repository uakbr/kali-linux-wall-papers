#!/usr/bin/env sh

set -e

rm -rf */wallpapers/

find */backgrounds/ -type f \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' \) \
| while read image
do
    wallpaper_type=$(echo $image | grep -o '\.png\|\.je\?pg')
    wallpaper_size=$(identify -format '%wx%h' $image)
    wallpaper_name=$(basename $image \
        | sed -E "s/-[[:digit:]]+x[[:digit:]]+${wallpaper_type}\$//;
                  s/-/ /g;
                  s/((^| )[a-z])/\U\1/g")
    wallpaper_name_camelcase=$(echo $wallpaper_name | sed 's/ //g')
    wallpapers_dir=$(dirname $image)/../../wallpapers/$wallpaper_name_camelcase
    mkdir -p $wallpapers_dir/contents/images/
    ## Tabs for a reason: <<-
    cat <<- EOF > $wallpapers_dir/metadata.desktop
		[Desktop Entry]
		Name=$wallpaper_name

		X-KDE-PluginInfo-Name=$wallpaper_name
		X-KDE-PluginInfo-Author=Kali Devel Team
		X-KDE-PluginInfo-Email=devel@kali.org
		X-KDE-PluginInfo-License=GPL-3.0+
	EOF
    ln -rsfv $image $wallpapers_dir/contents/images/$wallpaper_size$wallpaper_type
done
