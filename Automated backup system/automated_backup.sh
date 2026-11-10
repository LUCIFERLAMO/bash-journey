#!/bin/bash

function compressing {
    d=$(date +"%Y-%m-%d_%H-%M-%S")
    echo $d
    tar -czvf "$directory""$d".tar.gz "$directory"
    echo complete
    mv ""$directory""$d".tar.gz" dir
}

#compressing

function uncompressing {
    read 
    tar -xzvf "$directory""$d".tar.gz
    echo complete uncompressing
}

#uncompressing

function create_backup_folder {
    read -p "Enter the Backup directory name/path with name: " backup_dir
    mkdir "$backup_dir"
    echo "$backup_dir"
}

function options {
    echo 1.Create a backup folder
    echo 2. Compression >&2
    echo 3. Decompression >&2
    read -p "Enter your choice: " c 
    echo $c
}

function menu {
    read -p "Enter a directory path to be compressed: " directory
    echo $directory

    choice=$(options)
    case "$choice" in
       "1")
       create_backup_folder;;
       "2")
       compressing;;
       "3")
       uncompressing;;
       *)
       echo "invalid choice"
    esac 
}
menu