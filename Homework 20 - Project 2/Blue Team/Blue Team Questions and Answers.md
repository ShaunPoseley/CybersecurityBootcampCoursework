
## Day 2 Activity File: Incident Analysis with Kibana

Get familiar with running search queries in the `Discover` screen with Packetbeat. This will be located on your fourth tab in Chrome. 

- On the Discover page, locate the search field.
- Start typing `source` and notice the suggestions that come up.
- Search for the `source.ip` of your attacking machine.
- Use `AND` and `NOT` to further filter you search and look for communications between your attacking machine and the victim machine.
- Other things to look for: 
	- `url`
	- `status_code`
	- `error_code`

After creating your dashboard and becoming familiar with the search syntax, use these tools to answer the questions below:


1. Identify the offensive traffic.
   - Identify the traffic between your machine and the web machine:
     - When did the interaction occur?
        - 02:30
     - What responses did the victim send back?
        - Error Status 401 - Unauthorized
     - What data is concerning from the Blue Team perspective?
        - The large amount of unauthorized connections at a small amount of time is concerning.

2. Find the request for the hidden directory.
   - In your attack, you found a secret folder. Let's look at that interaction between these two machines.
     - How many requests were made to this directory? At what time and from which IP address(es)?
        - There were 49,647 requests from 02:20 - 02:40
     - Which files were requested? What information did they contain?
        - The file requested was /company_folders/secret_folder - a secret folder within company folders, it contained instructions on how to access the webdav server using Ryan's credentials and a hashed password.
     - What kind of alarm would you set to detect this behavior in the future?
        - This alarm will go off for any attempted access to this directory or file.
     - Identify at least one way to harden the vulnerable machine that would mitigate this attack.
        - Remove the file and directory from the server.
        - If the file cannot be removed, we will move it to a safer and/or offline location.

3. Identify the brute force attack.
   - After identifying the hidden directory, you used Hydra to brute-force the target server. Answer the following questions:
     - Can you identify packets specifically from Hydra?
        - There were 49,630 requests specifically from Hydra
     - How many requests were made in the brute-force attack?
        - 49,630 requests were made in the brute-force attack.
     - How many requests had the attacker made before discovering the correct password in this one?
        - 49,630 requests, 2 were successful in discovering the password.
     - What kind of alarm would you set to detect this behavior in the future and at what threshold(s)?
        - After enough Unauthorized codes are returned to the server, the server could automatically block all traffic from the IP address sending the codes for a set amount of time.
     - Identify at least one way to harden the vulnerable machine that would mitigate this attack.
        - Create an alert if 'user_agent.original' value includes 'Hydra' in the name.
        - Display a lockout message and lock the page from login for a temporary period of time from that user.

4. Find the WebDav connection.
   - Use your dashboard to answer the following questions:
     - How many requests were made to this directory?
        - 185
     - Which file(s) were requested?
        - The shell.php and the passwd.dav files were accessed
     - What kind of alarm would you set to detect such access in the future?
        - Create an alarm that goes off anytime this directory is accessed by a machine other than the machine that should have access.
     - Identify at least one way to harden the vulnerable machine that would mitigate this attack.
        - Connections to this shared folder should not be accessible from the web interface
        - Connections to this shared folder could be restricted by machine with a firewall rule.

5. Identify the reverse shell and meterpreter traffic.
   - To finish off the attack, you uploaded a PHP reverse shell and started a meterpreter shell session. Answer the following questions:
     - Can you identify traffic from the meterpreter session?
        - Yes
     - What kinds of alarms would you set to detect this behavior in the future?
        - Set an alert for any traffic moving through port '4444'.
        - Set an alert for any '.php' file that is uploaded to a server.
     - Identify at least one way to harden the vulnerable machine that would mitigate this attack.
        - The best way to remove this vulnerability is to completely restrict and remove the ability to upload files to this directory over the web interface.


---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.