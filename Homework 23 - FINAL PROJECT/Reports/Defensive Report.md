# Blue Team: Summary of Operations

## Table of Contents
- Network Topology
- Description of Targets
- Monitoring the Targets
- Patterns of Traffic & Behavior
- Suggestions for Going Further

### Network Topology

The following machines were identified on the network:
- Name of VM 1
  - **Operating System**: Kali Linux  
  - **Purpose**: Attacker
  - **IP Address**: 192.168.1.90
- Name of VM 2
  - **Operating System**: Ubuntu Linux
  - **Purpose**: Target 1
  - **IP Address**: 192.168.1.110

### Description of Targets

The target of this attack was: `Target 1` (192.168.1.110).

Target 1 is an Apache web server and has SSH enabled, so ports 80 and 22 are possible ports of entry for attackers. As such, the following alerts have been implemented:

### Monitoring the Targets

Traffic to these services should be carefully monitored. To this end, we have implemented the alerts below:

#### Excessive HTTP Errors
Alert 1 is implemented as follows:
  - **Metric**: Any http.response.status.code request ABOVE 400 in the last 5 minutes.
  - **Threshold**: Excessive 400> client side error messages.
  - **Vulnerability Mitigated**: This can potentially flag DoS attacks due to excessive requests
  - **Reliability**: This is considered a medium reliability alert due to false positives. There can potentially be excessive client side user errors creating these alerts. 

#### HTTP Request Size Monitor
Alert 2 is implemented as follows:
  - **Metric**: Any sum of http.request.bytes over all documents being above 3500 for the last 1 minute. 
  - **Threshold**: Maximum request queue length and cannot process any additional requests.
  - **Vulnerability Mitigated**: This can potentially flag attempted XSS attacks. 
  - **Reliability**: This is considered a high reliability alert due to potentially blocking a large payload request.

#### CPU Usage Monitor
Alert 3 is implemented as follows:
  - **Metric**: CPU packets over 0.5 lasting longer than 5 minutes.
  - **Threshold**: This threshold specifies the percentage of CPU resources which will be alerted if surpasses over 0.5%. 
  - **Vulnerability Mitigated**: This can potentially alert us if there is a malicious script running on our computer using excessive resources and slowing down our computers.
  - **Reliability**: This is considered a medium alert only due to the fact that the threshold is very low. Most programs run between 0.5-4.0% CPU usage. We can increase the threshold to 15%+ in order to catch malicious programs. 