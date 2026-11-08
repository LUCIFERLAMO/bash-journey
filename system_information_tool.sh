#!/bin/bash

function display_name {
    name=$(whoami)
    echo "---------------------"
    echo "The user is: $name"
}

display_name

function display_date_and_time { 
    date_and_time=$(date)
    echo "---------------------"
    echo "The date and time is: $date_and_time"
}

display_date_and_time

function system_information {
    system=$(hostnamectl)
    echo "---------------------"
    echo "System information"
    echo "$system"
}

system_information 

function disk_space {
    disk=$(lsblk)
    echo "---------------------"
    echo "Printing disk information"
    echo "$disk"
    echo "---------------------"
}

disk_space
