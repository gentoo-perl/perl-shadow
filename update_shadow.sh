#!/usr/bin/env bash
if [[ "x$1" == "x" ]]; then
  echo "Error. Pass path to your shadow overlay root as argument 1";
  exit 1;
fi

einfo() {
  echo -ne "\e[1;32m [info]\e[0;32m ";
  echo -ne $@
  echo -ne "\e[0m";
  echo
}

einfo "Builiding $1 from /usr/portage";
rsync -avp /usr/portage/dev-perl/ $1/dev-perl/
