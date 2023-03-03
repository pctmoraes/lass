# Write a shell script named latest_warnings.sh that prints the latest 5 warnings from the /var/log/bootstrap.log file.

cat /var/log/bootstrap.log | tail -n 5 > latest_warnings.txt