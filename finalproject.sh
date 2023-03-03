#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
# Set two variables equal to the values of the first and second command line arguments
targetDirectory=$1
destinationDirectory=$2

# [TASK 2]
# Display the values of the two command line arguments in the terminal
echo "$1"
echo "$2"

# [TASK 3]
# Define a variable called currentTS as the current timestamp, expressed in seconds
currentTS=`$(date +%s)`

# [TASK 4]
# Define a variable called backupFileName to store the name of the archived and compressed backup file that the script will create
backupFileName="backup-[$currentTS].tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
# Define a variable called origAbsPath with the absolute path of the current directory as the variable’s value
origAbsPath=`$(pwd)`

# [TASK 6]
# Define a variable called destAbsPath with value equal to the absolute path of the destination directory.
destDirAbsPath="$origAbsPath/backup"

# [TASK 7]
cd $origAbsPath
mkdir backup
cd $destDirAbsPath

# [TASK 8]
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# The line below declares a variable called toBackup, which is an array.
# An array contains a list of values, and items can be appended to arrays using the syntax: myArray+=($myVariable)
declare -a toBackup

for file in $(origAbsPath | ls) # [TASK 9]
do
  if ((`date -r $file +%s` > $yesterdayTS)) # [TASK 10]
  then # [TASK 11]
    toBackup+=($file)
  fi
done

# [TASK 12]
tar -czvf $backupFileName ${toBackup[@]}

# [TASK 13]
cp $backupFileName $destDirAbsPath/$backupFileName

# Congratulations! You completed the final project for this course!
#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
# Set two variables equal to the values of the first and second command line arguments
targetDirectory=$1
destinationDirectory=$2

# [TASK 2]
# Display the values of the two command line arguments in the terminal
echo "$1"
echo "$2"

# [TASK 3]
# Define a variable called currentTS as the current timestamp, expressed in seconds
currentTS=`$(date +%s)`

# [TASK 4]
# Define a variable called backupFileName to store the name of the archived and compressed backup file that the script will create
backupFileName="backup-[$currentTS].tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
# Define a variable called origAbsPath with the absolute path of the current directory as the variable’s value
origAbsPath=`$(pwd)`

# [TASK 6]
# Define a variable called destAbsPath with value equal to the absolute path of the destination directory.
destDirAbsPath="$origAbsPath/backup"

# [TASK 7]
cd $origAbsPath
mkdir backup
cd $destDirAbsPath

# [TASK 8]
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# The line below declares a variable called toBackup, which is an array.
# An array contains a list of values, and items can be appended to arrays using the syntax: myArray+=($myVariable)
declare -a toBackup

for file in $(origAbsPath | ls) # [TASK 9]
do
  if ((`date -r $file +%s` > $yesterdayTS)) # [TASK 10]
  then # [TASK 11]
    toBackup+=($file)
  fi
done

# [TASK 12]
tar -czvf $backupFileName ${toBackup[@]}

# [TASK 13]
cp $backupFileName $destDirAbsPath/$backupFileName

# Congratulations! You completed the final project for this course!
