#!/bin/bash
StudentsFile=students-list_0923.txt

# Define a function to create a student record
create_student() {
  # Prompt the user to enter the student email, age, and ID
  echo "Enter the student email:"
  read email
  echo "Enter the student age:"
  read age
  echo "Enter the student ID:"
  read id
  # Append the student record to the file
  echo "$email,$age,$id" >> "$StudentsFile"
  echo "Student record created successfully."
}

# Define a function to view all students saved in the file
view_students() {
  # Check if the file is empty
  if [ -s "$StudentsFile" ]; then
    # Print the header
    echo "Email,Age,ID"
    # Print the file content
    cat "$StudentsFile"
  else
    echo "No students found in the file."
  fi
}

# Define a function to delete a student from the file
delete_student() {
  # Prompt the user to enter the student ID
  echo "Enter the student ID to delete:"
  read id

  # Check if the ID is a valid 8-digit number
  if [[ $id =~ ^[0-9]{6}$ ]]; then
    # Check if the ID exists in the file
    if grep -q "$id" "$StudentsFile"; then
      # Delete the matching line from the file
      sed -i "/$id/d" "$StudentsFile"
      echo "Student record deleted successfully."
    else
      echo "Student ID not found in the file. Please try again."
    fi
  else
    echo "Invalid student ID. Please try again."
  fi
}

# Define a function to update a student record in the file
update_student() {
  # Prompt the user to enter the student ID
  echo "Enter the student ID to update:"
  read id

  # Check if the ID is a valid 8-digit number
  if [[ $id =~ ^[0-9]{6}$ ]]; then
    # Check if the ID exists in the file
    if grep -q "$id" "$StudentsFile"; then
      # Prompt the user to enter the new student email, age, and ID
      echo "Enter the new student email:"
      read email
      echo "Enter the new student age:"
      read age
      echo "Enter the new student ID:"
      read new_id
      # Check if the new ID is a unique 8-digit number
          if [[ $new_id =~ ^[0-9]{8}$ ]] && ! grep -q "$new_id" students-list_0923.txt; then
            # Update the matching line in the file
            sed -i "s/.*$id/$email,$age,$new_id/" students-list_0923.txt
            echo "Student record updated successfully."
          else
            echo "Invalid or duplicate student ID. Please try again."
	  fi

# Define a function to exit the application
exit_application() {
  echo "Thank you for using the application. Goodbye."
  exit 0
}

# Create an empty file to store the student records
touch students-list_0923.txt

# Display a welcome message
echo "Welcome to the ALU registration system."

# Display a menu of options
echo "Please choose one of the following options:"
echo "1. Create a student record"
echo "2. View all students saved in the file"
echo "3. Delete a student from the file"
echo "4. Update a student record in the file"
echo "5. Exit the application"

# Read the user's choice
read choice

# Execute the corresponding function based on the user's choice
case $choice in
  1) create_student ;;
  2) view_students ;;
  3) delete_student ;;
  4) update_student ;;
  5) exit_application ;;
  *) echo "Invalid option. Please try again." ;;
esac
done
