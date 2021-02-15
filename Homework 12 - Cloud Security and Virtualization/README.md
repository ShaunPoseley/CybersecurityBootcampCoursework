## Homework File: Cloud Security

Congratulations! You have finished the cloud security portion of the course.

Your homework assignment will be 2 parts:

### Part 1

Cloud computing has many terms and definitions that are unique to the cloud. As such, it is important to understand and remember this jargon when speaking to potential employers or peers.

In part 1 of the homework, our goal is to solidify many of the terms and concepts you have learned throughout the last 4 weeks of class.

#### Instructions

Answer the following questions in your own words:

1. What are 3 common job roles that combine security and cloud skills?
Cloud Security Analyst, Cloud Architect, Dev Sec Ops
2. What are the 3 biggest cloud provider platforms?
Microsoft Azure, AWS (Amazon Web Services), Google Cloud
3. What are the 6 most common cloud services (and their acronyms)?
SaaS (Software as a Service), CaaS (Communications as a Service), DaaS/DBaaS (Data/Database as a Service), XaaS (Anything as a Service), IaaS (Infrastructure as a Service), PaaS (Platform as a Service)
4. What is the difference between a virtual network and a physical network?
Physical is connected using hardware and cabling, Virtual is connected using software
5. What is the point of setting your first firewall rule to block _all_ traffic?
You block all traffic first so its easier to only allow the traffic that you want later
6. What is the difference between physical computing components (CPU, RAM, HDD/SSD) and virtual computing components? 
Using physical components tends to be faster and more efficient however, virtual is more cost effective and saves space
7. What is the purpose of using an encrypted ssh key to connect to a machine?
Using an encrypted ssh key makes connecting to a machine far more secure since the machine will only store the public key
8. What is the difference between a container and a virtual machine?
Containers only contain apps/files that are necessary to run and share a singular OS while a Virtual Machine contains its own OS and is able to perform more intensive tasks
9. What is a provisioner? Provide 3 examples of common provisioning software.
Provisioning is "the process of setting up IT infrastructure". Such as - Microsoft Aactive Directory, RSA Indentity Governance, and ActivID Authentication
10. What is meant by Infrastructure as Code?
Infrastructure as Code is the management and visualization of an infrastructure
11. What is Continuous Integration/Continuous Deployment?
CI/CD is the act of realeasing small changes and checks frequently in development. This is to make changes and integration more consistent which would make the quality of your software better.
12. What is a VPN and when should us use one?
A VPN is a Virtual Private Network. You should use a VPN whenever you are connected to a public internet connection in order to encrpyt your data.
13. What is the purpose of a load balancer?
A load balancer acts as a distributer for your network to properly direct traffic to available servers
14. What is a resource group in Azure?
A resource group is a container that groups multiple resources together to make administration easier
15. What is Region in Azure?
A region is where the physical datacenter of your VM would be located
### Part 2
#### Background

- During the last week, you created a highly available web server for XCorp's Red Team to use for testing and training.

- Your lead cloud administrator has asked for a diagram of the Network you created to keep for documentation and company records.

- Your task: Use [draw.io](https://app.diagrams.net/) to create a detailed diagram of your cloud infrastructure.

### Cloud Recap

When you're finished completing all the activities in cloud week, you should have:
- A total of 3 VMs running DVWA.

- All 3 VMs receiving traffic from your load balancer.

### Your Goal 

When you are finished with this assignment, you should have a network diagram that shows your entire cloud setup, including your Ansible jump box and the Docker containers running on each VM.

This document can be used as part of a portfolio to demonstrate your ability.

![](images\my-network-diagram.png)

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved. 
