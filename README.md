# Bash Journey

This repository contains a collection of beginner-to-intermediate Bash automation scripts focused on practical Linux tasks, file management, system monitoring, and productivity workflows.

## Projects Included

### 1. System Information Tool

Displays the current user, date and time, host information, and disk details using native Linux commands.

Usage:

```bash
bash "system_information_tool.sh"
```

### 2. File Organizer

Organizes files from a source directory into categorized folders based on extension.

Supported file types:
- .txt -> text_file
- .pdf -> pdf_file
- .mp3 -> mp3_file
- .jpg -> jpg_file

Usage:

```bash
bash "File Organize/file_organize.sh" "File Organize/mix_extentions"
```

### 3. Personal Expense Calculator

A menu-driven shell script for managing a personal budget, including adding expenses, adding credits, checking the current balance, and exiting the program.

Usage:

```bash
bash "personal_expense_caluclator/personal_expense_cal.sh"
```

### 4. Log Analyzer

Reads system log files and summarizes key events such as warnings, errors, and successful/failed SSH login attempts over a chosen time range.

Usage:

```bash
bash "log analyzer/log_analyzer.sh"
```

### 5. Automated Backup System

Creates, compresses, extracts, and cleans up backup archives for directories on the system.

Features:
- Create a backup folder
- Compress any folder into a timestamped .tar.gz archive
- Restore files from a backup archive
- Remove old backup archives based on age

Usage:

```bash
bash "Automated backup system/automated_backup.sh"
```

The script presents a menu with the following options:
1. Create a backup folder
2. Compression
3. Decompression
4. Remove old backups
5. Exit

## Repository Goal

These scripts are designed to improve shell scripting skills through real-world automation tasks and to build confidence using Bash for everyday system administration and productivity workflows.
