#!/bin/bash

# Cut the first field (email) from the file and save it to another file
cut -d "|" -f 1 students-list_0923.txt > student-emails.txt
