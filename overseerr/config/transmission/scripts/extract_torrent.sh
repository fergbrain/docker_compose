#!/bin/bash
CUR_DIR=`pwd` 
cd $TR_TORRENT_DIR
test -d "$TR_TORRENT_NAME" && cd "$TR_TORRENT_NAME"
unrar e -inul *.rar
7z e *.zip > /dev/null 2>&1
cd $CUR_DIR
