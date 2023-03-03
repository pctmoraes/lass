# Understand crontab file syntax

# minute (0-59)
# hour(0-23, 0 = midnight)
# day (1-31)
# month (1-12)
# weekday (0-6, 0 = Sunday)

# The -l option of the crontab command prints the current crontab.
crontab -l

# If a crontab isnt' created it will display 'no crontab for $USERNAME'

# To add a cron job, run the command below
crontab -e

# Write a cron tab that will write into 'echo.txt' the message 'Wellcome to cron' every day at 21:00
0 21 * * * echo "Welcome to cron" >> /tmp/echo.txt

# To remove all the cronjobs in the crontab, run the command below
crontab -r