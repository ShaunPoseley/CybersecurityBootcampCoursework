## Week 5 Homework Submission File: Archiving and Logging Data

Please edit this file by adding the solution commands on the line below the prompt.

Save and submit the completed file for your homework submission.

---

### Step 1: Create, Extract, Compress, and Manage tar Backup Archives

1. Command to **extract** the `TarDocs.tar` archive to the current directory:
    tar --extract -f TarDocs.tar
2. Command to **create** the `Javaless_Doc.tar` archive from the `TarDocs/` directory, while excluding the `TarDocs/Documents/Java` directory:
    tar --create -f Javaless_Doc.tar --exclude=TarDocs/Documents/Java TarDocs/
3. Command to ensure `Java/` is not in the new `Javaless_Docs.tar` archive:
    tar -tvf Javaless_Doc.tar | grep Java

#### Critical Analysis Question

- Why wouldn't you use the options `-x` and `-c` at the same with `tar`?
    Because -x is extract and -c is create. There is no use in creating an archive file that you are going to create in the same line and vice versa.
---

### Step 2: Create, Manage, and Automate Cron Jobs

1. Cron job for backing up the `/var/log/auth.log` file:
    0 6 * * 3 tar -czf /var/backup/auth_backup.tgz /var/log/auth.log
---

### Step 3: Write Basic Bash Scripts

1. Brace expansion command to create the four subdirectories:
    mkdir -p backups/{freemem,diskuse,openlist,freedisk}
2. Paste your `system.sh` script edits below:

    ```bash
    #!/bin/bash
    free -h | grep -i mem | awk -F" " '{print "Free", $1, $4}' > ~/backups/freemem/free_mem.txt
    du -hs | awk -F" " '{print "Disk Usage:", $1}' > ~/backups/diskuse/disk_usage.txt
    ps -aef > ~/backups/openlist/open_list.txt
    df -h > ~/backups/freedisk/free_disk.txt
    ```

3. Command to make the `system.sh` script executable:
    chmod +x system.sh
**Optional**
- Commands to test the script and confirm its execution:
    sudo ./system.sh
    cd backups/freemem && cat free_mem.txt
    cd backups/diskuse && cat disk_usage.txt
    cd backups/openlist && cat open_list.txt
    cd backups/freedisk && cat free_disk.txt

### Step 4. Manage Log File Sizes
 
1. Run `sudo nano /etc/logrotate.conf` to edit the `logrotate` configuration file. 

    Configure a log rotation scheme that backs up authentication messages to the `/var/log/auth.log`.

    - Add your config file edits below:

    ```bash
    /var/log/auth.log {
        weekly
        rotate 7
        notifempty
        delaycompress
        missingok
    }
    ```
---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.