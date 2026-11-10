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

This Bash script analyzes system logs and shows:
- Total number of errors
- Total number of warnings
- Successful SSH logins
- Failed SSH logins

### Usage

```bash
bash "log analyzer/log_analyzer.sh"
```

This script provides an interactive time-range menu so you can view log activity for today, yesterday, or recent periods such as the last hour or last week.
