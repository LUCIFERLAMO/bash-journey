#!/bin/bash

folder_name=$1

function org {

    if [[ -z "$folder_name" ]]; then
        echo "enter a folder name"
        exit 1
    fi

    echo "Opening $folder_name"
    $(mkdir text_file pdf_file jpg_file mp3_file)

    for file in $(ls $folder_name)
    do
       #echo "$file"
       if [[ $file  == *.txt ]]; then
           mv $folder_name/$file text_file
       fi
       if [[ $file == *.pdf ]]; then
           mv $folder_name/$file pdf_file
       fi
       if [[ $file == *.mp3 ]]; then
           mv $folder_name/$file mp3_file
       fi
       if [[ $file == *.jpg ]]; then
           mv $folder_name/$file jpg_file
       fi

    done
}

org 

