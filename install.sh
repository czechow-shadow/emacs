#!/bin/bash

set -eu -o pipefail

DEST_DIR=~
EMACS_CUSTOM_DIR="$DEST_DIR/.emacs.d/custom"

FILES=(.emacs .emacs.d)
FORCE=
declare -A GIT_REPOS=(\
[https://github.com/czechow-shadow/projectile-ghcid.git]=master \
[https://github.com/chrisdone/intero.git]=master \
[https://github.com/jyp/dante.git]=master \
)

usage() {
  echo "Usage: `basename $0` [--force]";
}

if [ $# = 1 ]; then
  if [ "$1" = "--force" ]; then
    FORCE=1;
  else
    usage;
	exit 1;
  fi
fi

GIT_DIRS=()
for u in ${!GIT_REPOS[@]}; do
  dir=`basename $u .git`;
  GIT_DIRS+=(../$dir);
done

BACKUP_SUFFIX=_`date '+%F_%T'`

for f in ${GIT_DIRS[@]}; do
  fb="${f}$BACKUP_SUFFIX";
  echo "Checking [$f]";

  if [ -e "$f" -o -h "$f" ]; then
    echo "$f already exists";
    if [ -n "$FORCE" ]; then
      echo "Backing up $f to $fb";
      mv "$f" "$fb";
    else
      echo "Aborted";
      exit 2;
    fi
  fi
done

for i in ${FILES[@]}; do
  f="$DEST_DIR/$i";
  fb="$DEST_DIR/${i}${BACKUP_SUFFIX}";
  echo "Checking [$f]";

  if [ -e "$f" -o -h "$f" ]; then
    echo "$f already exists";
    if [ -n "$FORCE" ]; then
      echo "Backing up $f to $fb";
      mv "$f" "$fb";
    else
      echo "Aborted";
      exit 2;
    fi
  fi
done

echo "Installing emacs packages"
emacs --batch -q -l init.el

mkdir -p "$EMACS_CUSTOM_DIR";

echo "Installing customized packages"
for u in ${!GIT_REPOS[@]}; do
  dir=`basename $u .git`;
  rev=${GIT_REPOS[$u]}

  ( cd .. && git clone "$u" && cd "$dir" && git checkout "$rev" )

  d=`readlink -f ../"$dir"`;
  ( cd "$EMACS_CUSTOM_DIR" && ln -s "$d" "$dir" )
done

d=`pwd`;

( cd "$DEST_DIR" && ln -s "$d"/emacs .emacs )


