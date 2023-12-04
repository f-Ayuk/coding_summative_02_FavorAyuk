#!/bin/bash

# Define a variable to store the directory name
dir="negpod_$1-q1"

# Check if the directory exists
if [ -d "$dir" ]; then
  # If it exists, print a message
  echo "The directory $dir already exists."
else
  # If it does not exist, create it
  mkdir "$dir"
  # Print a message
  echo "The directory $dir was created."
fi

# Move the four files created in question 1 to the directory
mv "student-emails.txt" "$dir"
mv "student-ages.txt" "$dir"
mv "student-ids.txt" "$dir"
mv "students-list_0923.txt" "$dir"

# Print a message
echo "The four files were moved to the directory $dir."
