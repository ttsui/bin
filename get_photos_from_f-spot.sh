#!/bin/bash
database="$HOME/.config/f-spot/photos.db"
wallpaperdir="$HOME/Pictures/Wallpapers"
tag=$1
sqlite3 "$database" "select photos.base_uri, photos.filename from tags, photo_tags, photos where tags.name = '$tag' and photo_tags.tag_id = tags.id and photos.id = photo_tags.photo_id;" | sed s/"|"/"\/"/g | sed 's|file://||g' >> photolist.$$
while read line
do
picname=`basename "$line"`
echo "$picname : $line"
if [ ! -h $wallpaperdir/$picname ] ; then
       ln -s "$line" $wallpaperdir/
else
       echo "symlink already exists"
fi
done < photolist.$$
rm photolist.$$

