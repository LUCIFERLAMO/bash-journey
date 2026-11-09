#!/bin/bash

function menu {
    echo "------------------------------"
    echo "options" >&2
    echo "1. Debit amount" >&2
    echo "2. Credit amount" >&2
    echo "3. view balance " >&2
    echo "4. Exit" >&2
    
    read -p "Enter choice (1 2 3 4): " choice
    echo $choice
}

num=1
amount=0

function test {
    while [[ $num -eq 1 ]];
    do 
       c=$(menu)
       if [[ $c -eq "1" ]]; then
           read -p  "Enter the amount to be added: " debit
           amount=$(echo "$amount" + "$debit" | bc)
           echo "Amount of $debit Debited "
           echo "-------------------------------"
       fi
       if [[ $c -eq "2" ]]; then
           read -p "Enter the amount to be credited: " credit
           if [[ $credit -gt $amount ]]; then
               echo "U have less balance"
               echo "-------------------------------"
           else 
               amount=$(echo "$amount" - "$credit" | bc)
               echo "Amount of $credit was Credited"
               echo "-------------------------------"
           fi
       fi
       if [[ $c -eq "3" ]]; then
           echo "Your Balance: $amount"
           echo "-------------------------------"
       fi
       if [[ $c -eq "4" ]]; then 
           echo "Exiting the program........"
           num=0
       fi
    done
}

test