#!/bin/bash

function compressing {
    read -r -p "Enter the directory to be compressed: " compressed_dir
    read -r -p "Enter the backup destination: " backup_destination

    if [[ ! -d "$compressed_dir" ]]; then
        echo "[-] Source directory does not exist"
        return 1
    fi

    if [[ ! -d "$backup_destination" ]]; then
        echo "[-] Backup destination does not exist"
        return 1
    fi

    echo "[+] Creating timestamp..."
    d=$(date +"%Y-%m-%d_%H-%M-%S")

    archive_name="$(basename "$compressed_dir")_${d}.tar.gz"

    echo "[+] Starting compression..."

    if tar -czvf "$backup_destination/$archive_name" \
        -C "$(dirname "$compressed_dir")" \
        "$(basename "$compressed_dir")"; then

        echo "[+] Compression completed successfully"
        echo "[+] Backup saved at: $backup_destination/$archive_name"
    else
        echo "[-] Compression failed"
        return 1
    fi
}

function uncompressing {
    read -r -p "Enter the backup archive path: " archive_path
    read -r -p "Enter the extraction destination: " extraction_destination

    if [[ ! -f "$archive_path" ]]; then
        echo "[-] Backup archive does not exist"
        return 1
    fi

    if [[ ! -d "$extraction_destination" ]]; then
        echo "[-] Extraction destination does not exist"
        return 1
    fi

    echo "[+] Starting decompression..."

    if tar -xzvf "$archive_path" -C "$extraction_destination"; then
        echo "[+] Decompression completed successfully"
        echo "[+] Files extracted to: $extraction_destination"
    else
        echo "[-] Decompression failed"
        return 1
    fi
}

function create_backup_folder {
    read -r -p "Enter the backup directory path: " backup_dir

    if [[ -z "$backup_dir" ]]; then
        echo "[-] Directory path cannot be empty"
        return 1
    fi

    if [[ -d "$backup_dir" ]]; then
        echo "[!] Directory already exists: $backup_dir"
    elif mkdir -p "$backup_dir"; then
        echo "[+] Backup directory created at: $backup_dir"
    else
        echo "[-] Failed to create backup directory"
        return 1
    fi
}

function remove_old_backups {
    read -r -p "Enter the backup directory: " backup_destination
    read -r -p "Remove backups older than how many days? " days

    if [[ ! -d "$backup_destination" ]]; then
        echo "[-] Backup directory does not exist"
        return 1
    fi

    if [[ ! "$days" =~ ^[0-9]+$ ]] || (( days < 1 )); then
        echo "[-] Enter a valid number of days"
        return 1
    fi

    echo "[+] Backups eligible for deletion:"

    find "$backup_destination" -maxdepth 1 -type f \
        -name "*.tar.gz" -mtime +"$((days - 1))" -print

    read -r -p "Delete these backups? (y/n): " confirm

    if [[ "$confirm" == "y" ]]; then
        find "$backup_destination" -maxdepth 1 -type f \
            -name "*.tar.gz" -mtime +"$((days - 1))" -delete

        echo "[+] Old backups removed"
    else
        echo "[!] Deletion cancelled"
    fi
}

function menu {
    while true; do
        echo
        echo "-----------------------------------"
        echo "       AUTOMATED BACKUP SYSTEM     "
        echo "-----------------------------------"
        echo "1. Create a backup folder"
        echo "2. Compression"
        echo "3. Decompression"
        echo "4. Remove old backups"
        echo "5. Exit"
        echo "-----------------------------------"

        read -r -p "Enter your choice: " choice

        case "$choice" in
            1)
                create_backup_folder
                ;;
            2)
                compressing
                ;;
            3)
                uncompressing
                ;;
            4)
                remove_old_backups
                ;;
            5)
                echo "[+] Exiting backup system..."
                break
                ;;
            *)
                echo "[-] Invalid choice"
                ;;
        esac
    done
}

menu