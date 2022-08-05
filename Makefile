build:
	bin/generate-symlinks-16x9.sh
	bin/generate-kde-wallpapers.sh
	bin/legacy-gnome-backgrounds-16x9.sh
	# Reduce size of images with lossy compression (pngquant)
	find */backgrounds/ -type f -name "*.png" -exec \
	  pngquant --skip-if-larger --speed=1 --strip --verbose -f {} --output {} \;
