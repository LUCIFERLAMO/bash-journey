# bash-journey

## Level: Intermediate

This repository contains a collection of intermediate Bash automation projects focused on practical system tasks, file management, and log analysis. The scripts are designed to improve command-line workflow, shell logic, and real-world scripting skills through hands-on projects.

## Project 1: System Information Tool

This script shows the current username, date and time, operating system, disk space, and memory usage.

## Project 2: File Organizer

This script organizes files from a target folder into separate folders based on file type:
- .txt files move to text_file
- .pdf files move to pdf_file
- .mp3 files move to mp3_file
- .jpg files move to jpg_file

### Usage

```bash
bash "File Organize/file_organize.sh" mix_extentions
```

This command organizes all supported files from the mix_extentions folder into the matching output folders.

## Project 3: Personal Expense Calculator

This Bash script lets you perform the following actions:
- Add a debit amount
- Credit an amount from the balance
- View the current balance
- Exit the program

### Usage

```bash
bash "personal_expense_caluclator/personal_expense_cal.sh"
```

This script runs a simple menu-based personal expense calculator in the terminal.

## Project 4: Log Analyzer

This project helps monitor system activity by reading Linux logs and summarizing important events from a selected time period.

It does the following:
- Checks the total number of system errors
- Checks the total number of warnings
- Tracks successful SSH login attempts
- Tracks failed SSH login attempts
- Lets the user choose a time range such as today, yesterday, recent hours, or previous days

### Usage

```bash
bash "log analyzer/log_analyzer.sh"
```

This script shows a simple menu-based log summary that helps you quickly review server health and login activity from the terminal.
