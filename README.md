# Infrastructure for Cybersecurity Attack Simulation Lab

## Overview

This project sets up a controlled environment within AWS for conducting cybersecurity attack simulations. It includes three EC2 instances designed to represent an attacker, a Linux victim, and a Windows victim. This infrastructure is intended for educational purposes, allowing students to explore both offensive and defensive cybersecurity tactics.

## Lab Experience Description

Participants will engage in a hands-on experience, simulating cyber-attacks against predefined targets under controlled conditions. The lab is designed to:

- Demonstrate the process of planning and executing a cyber-attack.
- Understand the vulnerabilities that exist within different operating systems.
- Apply cybersecurity measures to detect, prevent, and mitigate attacks.

## Disclaimer

This lab is intended for educational purposes only. Any actions and or activities related to the material contained within this documentation are the sole responsibility of the user. The misuse of the information in this documentation can result in criminal charges brought against the persons in question. The authors and contributors will not be held responsible in the event any criminal charges be brought against any individuals misusing the information in this documentation to break the law.

## Infrastructure Documentation

### Components

- **AWS Virtual Private Cloud (VPC):** A private network to host all resources securely.
- **Subnet:** A subdivision within the VPC to allocate IP addresses to resources.
- **Security Group:** Defines the rules for inbound and outbound traffic to the EC2 instances.

### EC2 Instances

- **Attacker Instance:** Simulates the attacker's environment from which cyber-attacks are launched.
- **Linux Victim Instance:** Represents a vulnerable Linux system targeted in the simulation.
- **Windows Victim Instance:** Acts as a vulnerable Windows system for attack simulations.

### Setup Guide

1. **Preparation:**
   - Ensure you have an AWS account and your CLI is configured.
   - Install Terraform on your local machine.
   - Generate or use an existing SSH key pair for EC2 instance access.

2. **Deployment:**
   - Clone the provided repository.
   - Navigate to the project directory and initialize Terraform with `terraform init`.
   - Apply the Terraform configuration with `terraform apply`, reviewing the plan before confirming.

3. **Lab Execution:**
   - Access the instances using SSH/RDP with the provided key pair.
   - Follow the lab guide to simulate attacks and implement defense strategies.

4. **Cleanup:**
   - After completing the lab, use `terraform destroy` to remove all resources and avoid unnecessary charges.

## Ethical Considerations

- Always conduct simulations within the confines of your own controlled environment.
- Do not attempt to exploit real systems or networks without explicit permission.
- Adhere to ethical guidelines and legal requirements at all times.

By participating in this lab, you agree to use the knowledge and skills gained in a responsible and ethical manner.
