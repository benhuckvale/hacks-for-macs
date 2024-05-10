#!/bin/bash

# Problem:
# When you take a screenshot on a mac, by default it puts it straight into your
# Desktop folder. After taking a lot of screenshots this can become quite
# cluttered!
#
# Solution:
# This script is designed to organize such screenshots stored on the Desktop
# into directories categorized by year and quarter.  It processes files
# matching the pattern 'Screenshot*.png', extracts the date from each filename,
# and then determines the corresponding year and quarter (Q1 for Jan-Mar, Q2
# for Apr-Jun, Q3 for Jul-Sep, Q4 for Oct-Dec). Each screenshot is moved from
# the Desktop to a directory structure like 'Screenshots/2024/Q1'. This
# organization helps declutter the Desktop, makes it easier to find screenshots
# from a specific time period, and may improve system performance by reducing
# the number of items the WindowServer needs to manage directly on the Desktop.

# Check if a command line argument is provided and is a valid directory
if [ -d "$1" ]; then
    src_dir="$1"
else
    src_dir="/Users/$USER/Desktop"
fi

# Additional message for clarity in case of an invalid argument
if [ "$#" -gt 0 ] && [ ! -d "$1" ]; then
    echo "Provided directory $src_dir does not exist."
    exit
fi

# Base directory for organized screenshots
dest_base_dir="/Users/$USER/Desktop/Screenshots"

# Loop over each screenshot file in the Desktop directory
for file in "$src_dir"/Screenshot*.png; do
    # Check if the file actually exists to handle the case when the glob does not match any files
    if [ -f "$file" ]; then
        # Extract the year and month from the filename
        year=$(echo "$file" | grep -oE 'Screenshot [0-9]{4}-[0-9]{2}-[0-9]{2}' | cut -d'-' -f1 | awk '{print $2}')
        month=$(echo "$file" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | cut -d'-' -f2)

        # Validate the year and month
        if ! [[ $year =~ ^[0-9]{4}$ ]] || ! [[ $month =~ ^0[1-9]|1[0-2]$ ]]; then
            echo "Invalid date format in filename: $file"
            continue
        fi

        # Extract month and force decimal interpretation by removing leading zero
        month=$(echo "$month" | sed 's/^0*//')

        # Determine the quarter
        if [[ "$month" -le 3 ]]; then
            quarter="Q1"
        elif [[ "$month" -le 6 ]]; then
            quarter="Q2"
        elif [[ "$month" -le 9 ]]; then
            quarter="Q3"
        elif [[ "$month" -le 12 ]]; then
            quarter="Q4"
        else
            echo "Invalid month for quarter calculation: $month"
            continue
        fi

        # Create the destination directory path
        dest_dir="$dest_base_dir/$year/$quarter"

        # Create the destination directory if it doesn't exist
        mkdir -p "$dest_dir"

        # Move the file to the destination directory
        mv "$file" "$dest_dir"
        echo "Moved \"$file\" to $dest_dir"
    else
        echo "No screenshot files found to move."
    fi
done

