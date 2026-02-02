#!/bin/bash

LOGFILE=$HOME/winhome/backup/${WSL_DISTRO_NAME}.log
SRC_DIR=/home/leons
DEST_DIR=/mnt/Default/Virtuals/backups
SERVER=truenas.dyn.homenet
# rsync SRC to DEST on SERVER

rsync --progress -av $SRC_DIR/ lstrong@$SERVER:$DEST_DIR/$WSL_DISTRO_NAME/

