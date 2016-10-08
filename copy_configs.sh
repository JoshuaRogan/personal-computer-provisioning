#!/bin/bash

copy_git ()
{ # A somewhat more complex function.
  # Backup & copy git config
  echo "Copying ~/.gitconfig"
  GIT_CONFIG_LOCATION=~/.gitconfig
  cp $GIT_CONFIG_LOCATION $GIT_CONFIG_LOCATION.$(date +%s).bak
  cp configs/.gitconfig $GIT_CONFIG_LOCATION
}

copy_htoprc ()
{ # A somewhat more complex function.
  # Backup & copy git config
  echo "Copying ~/.config/htop/htoprc"
  HTOP_CONFIG_LOCATION=~/.config/htop/htoprc
  cp $HTOP_CONFIG_LOCATION $HTOP_CONFIG_LOCATION.$(date +%s).bak
  cp configs/htoprc $HTOP_CONFIG_LOCATION
}


if [ ! -z "$1" ]; then
  # echo $([ ! $1 ])
  if [ $1 == "-all" ]; then
    # Run Everything
    copy_git
  else
    if [ $1 == "-git" ]; then
        copy_git
    fi
    if [ $1 == "-htop" ]; then
        copy_htoprc
    fi
  fi
else
  echo "Error you must supply an argument"
fi
