#!/bin/bash

arg=today

function Total_errors {
    errors=$(journalctl -p err..err --since "$arg" | wc -l)
    echo $errors
}

function Total_warnings {
    warnings=$(journalctl -p warning..warning --since "$arg" | wc -l)
    echo $warnings
}

function Successful_ssh_login {
    success=$(journalctl -u ssh --since "$arg" | grep -c "Accepted")
    echo $success
}

function Failed_ssh_login {
    Fail_ssh_count=$(journalctl -u ssh --since "$arg" | grep -c "Failed password")
    echo $Fail_ssh_count
}

# --------
function options {
    echo "---------------------------------------------" >&2
    echo "             Single Argument                 " >&2
    echo "---------------------------------------------" >&2
    echo "1. today              - From the beginning of today" >&2
    echo "2. yesterday          - Yesterday" >&2
    echo "3. now                - Current time" >&2
    echo "4. 1 hour ago         - One hour before now" >&2
    echo "5. 30 minutes ago     - 30 minutes before now" >&2
    echo "6. 2 days ago         - Two days before now" >&2
    echo "7. 1 week ago         - One week before now" >&2
    read -p "Enter your choice number " choice
    echo "$choice"
}

function display {
    
    echo "----------------------------------------------------------------"
    echo "                                                                "
    echo "--------------------------------------------------------------- "
    echo "Total Number of errors:                 $(Total_errors)         "
    echo "Total Number of warnings:               $(Total_warnings)       "
    echo "Total Number of successful SSH logins:  $(Successful_ssh_login) "
    echo "Total Number of Failed SSH logins:      $(Failed_ssh_login)     "
    echo "----------------------------------------------------------------"
}

function menu {
   echo "============================================================"
   echo "                     LOG FILE ANALYZER"
   echo "============================================================"
   selected=$(options)
   case "$selected" in
       "1")
       display;;    
       "2")
       arg="yesterday"
       display;;
       "3")
       arg="now"
       display;;
       "4")
       arg="1 hour ago"
       display;;
       "5")
       arg="30 minutes ago"
       display;;
       "6")
       arg="2 days ago"
       display;;
       "7")
       arg="1 week ago"
       display;;
       *)
       echo "invalid choice";;   
   esac
}
menu 
