#!/usr/bin/env sh

set -e

GNOME_XML=legacy/gnome-background-properties/kali-backgrounds_legacy.xml

mkdir -p $(dirname $GNOME_XML)

cat << EOF > $GNOME_XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
EOF

for image in $(LC_COLLATE=C echo legacy/backgrounds/kali-16x9/*)
do
    cat << EOF
  <wallpaper>
    <name>$(basename $image | sed -E "s/\.(png|jpe?g)$//;
                  s/-/ /g;
                  s/((^| )[a-z])/\U\1/g")</name>
    <filename>/usr/share/backgrounds/kali-16x9/$(basename $image)</filename>
    <options>zoom</options>
    <shade_type>solid</shade_type>
    <pcolor>#ffffff</pcolor>
    <scolor>#000000</scolor>
  </wallpaper>
EOF
done >> $GNOME_XML

echo '</wallpapers>' >> $GNOME_XML

cat $GNOME_XML
