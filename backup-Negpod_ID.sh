#!/bin/bash

# Creates shell script to back up the directory in part a
host="2f05c1f8800b.3be8ebfc.alu-cod.online"
user="2f05c1f8800b"
password="d4a1d225d0abda9549d8"
directory="coding_summative_02_FavorAyuk/"
backup_location="/summative/0923-2023S"
sshpass -p $password scp -r $directory $user@$host:$backup_location
