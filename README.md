## New wallpapers (including legacy)

Add the new wallpapers inside `<wallpaper-package>/backgrounds` with the following name format:
`<name>-<height>x<width>.xxx` (use aspect ratio instead of height & width for new images).
Supported file types are: `png`, `jpg` and `jpeg`.

The same wallpaper could include different variants optimized for different display sizes, usually: `16x9`, `16x10` and `4x3`.

**The quick way to generate files is to run `make`**, else to manually run the scripts, make sure to run the following commands, in order, from the root of the project folder:
- First run: `./bin/generate-symlinks-16x9.sh` to update/add all the symlinks inside `*/backgrounds/kali-16x9`, required for Xfce.
    - At least one of the wallpaper variants has to be named with the `16x9` ratio (1920x1080 and 1920x1200 is allowed for legacy images) in order to be included.
- Afterwards run: `./bin/generate-kde-wallpapers.sh` to update/add all the symlinks inside `*/wallpapers`, required for KDE.

The latest package of `kali-wallpapers` requires an SVG version of the login image to satisfy desktop-base requirements. Usually this is an SVG file containing the PNG image inside, as SVGs take extra time to calculate and are not optimal for small devices.

`<wallpaper-package>/gnome-background-properties/kali-backgrounds_<wallpaper-package>.xml` is manually generated and required for GNOME.

## Legacy wallpapers only

- Run `bin/legacy-gnome-backgrounds-16x9.sh` to automatically update `legacy/gnome-background-properties/kali-backgrounds_legacy.xml`, required for GNOME.
    - Make sure to run `./bin/generate-symlinks-16x9.sh` beforehand.
