#!/bin/bash

set -ex

function link_dirs() {
    SRC_DIR="$1"
    declare -a FILES=("${!2}")

    for FILE in "${FILES[@]}"; do
        if [ -e "$FILE" ]; then
            if [ -d "$FILE" ]; then 
                if [ -n "`ls $FILE`" ]; then
                    mv "$FILE" ${FILE}-orig
                else
                    rmdir "$FILE"
                fi
            else
                mv "$FILE" ${FILE}-orig
            fi
        fi
    
        ln -s "${SRC_DIR}${FILE}" "$FILE"
    done
}

COMMON_SRC_DIR="../tony-common/"
COMMON_FILES=("Applications" 
              "Desktop"
              "devel"
              "Documents"
              "Dropbox"
              "Music"
              ".bashrc"
              ".gitconfig"
              ".gnupg"
              ".ssh"
              ".nx"
              ".vim"
              ".vimrc")
link_dirs "$COMMON_SRC_DIR" COMMON_FILES[@]

WIN_SRC_DIR="/mnt/Windows/Documents and Settings/Win7/My Documents/My "
WIN_FILES=("Pictures" "Videos")
link_dirs "$WIN_SRC_DIR" WIN_FILES[@]
