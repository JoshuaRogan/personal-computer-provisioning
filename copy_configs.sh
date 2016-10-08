#!/bin/bash

# Backup & copy git config
GIT_CONFIG_LOCATION=~/.gitconfig
cp $GIT_CONFIG_LOCATION $GIT_CONFIG_LOCATION.$(date +%s).bak
cp configs/.gitconfig $GIT_CONFIG_LOCATION
