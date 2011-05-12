#!/usr/bin/env bash
if [[ "x$1" == "x" ]]; then
  echo "Error. Pass path to your shadow overlay root as argument 1";
  exit 1;
fi

src='/usr/portage';
dest=$1;

einfo() {
  echo -ne "\e[1;32m [info]\e[0;32m ";
  echo -ne $@
  echo -ne "\e[0m";
  echo
}

einfo "Builiding $dest from $src";

rsync -avp $src/dev-perl/ $dest/dev-perl/
rsync -avp $src/perl-core/ $dest/perl-core/
for i in $(cat $dest/dev-lang.list); do
  rsync -avp $src/dev-lang/$i/ $dest/dev-lang/$i/
done
