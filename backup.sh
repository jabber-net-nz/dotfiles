#!/bin/bash

LOGFILE=$HOME/winhome/backup/${WSL_DISTRO_NAME}.log
SRC_DIR=/home/leons
DEST_DIR_A=/mnt/Default/Virtuals/backups
DEST_DIR_B=/mnt/virtuals/backups
SERVERA=truenas.dyn.homenet
SERVERB=trunx.dyn.homenet

# rsync SRC to DEST on SERVER
echo "Copying to truenas"echo "Copying to truenas"
rsync --progress -av --delete $SRC_DIR/ lstrong@$SERVERA:$DEST_DIR_A/$WSL_DISTRO_NAME/
echo "Copying to trunx"
rsync --progress -av --delete $SRC_DIR/ leons@$SERVERB:$DEST_DIR_B/$WSL_DISTRO_NAME/

