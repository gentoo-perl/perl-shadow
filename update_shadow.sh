#!/usr/bin/env bash
if [[ "x$1" == "x" ]]; then
  echo "Error. Pass path to your shadow overlay root as argument 1";
  exit 1;
fi

src='/usr/portage';
dest=$1;
RSYNC='rsync -avp --delete-delay'


einfo() {
  echo -ne "\e[1;32m [info]\e[0;32m ";
  echo -ne $@
  echo -ne "\e[0m";
  echo
}

einfo "Builiding $dest from $src";

$RSYNC $src/dev-perl/ $dest/dev-perl/
$RSYNC $src/perl-core/ $dest/perl-core/
$RSYNC --filter="-! /perl-*/***" $src/virtual/ $dest/virtual/
for i in $(cat $dest/dev-lang.list); do
  $RSYNC $src/dev-lang/$i/ $dest/dev-lang/$i/
done

