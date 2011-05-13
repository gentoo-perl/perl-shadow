#!/usr/bin/env bash
if [[ "x$1" == "x" ]]; then
  echo "Error. Pass path to your shadow overlay root as argument 1";
  exit 1;
fi

src='/usr/portage';
dest=$1;
updaterdir=$dest/updater
listdir=$updaterdir/lists

RSYNC='rsync -avp --delete-delay'


einfo() {
  echo -ne "\e[1;32m [info]\e[0;32m ";
  echo -ne $@
  echo -ne "\e[0m";
  echo
}

einfo "Builiding $dest from $src";
einfo "all: dev-perl";
$RSYNC $src/dev-perl/ $dest/dev-perl/
einfo "all: perl-core";
$RSYNC $src/perl-core/ $dest/perl-core/
einfo "prefixed: perl-* : virtual"
$RSYNC --filter="-! /perl-*/***" $src/virtual/ $dest/virtual/
for listcat in $listdir/*.list ; do
  srcfile=$(basename $listcat);
  category=${srcfile/.list};
  einfo "list selective: $category"
  $RSYNC $src/$category/ $dest/$category/ --files-from=${listcat};
done

einfo "Regenerating Categories list"
cat <(
  echo 'dev-perl';
  echo 'perl-core';
  echo 'virtual';
  for listcat in $listdir/*.list; do
    srcfile=$(basename $listcat);
    category=${srcfile/.list};
    echo $category;
  done
) | sort -u >| $dest/profiles/categories
