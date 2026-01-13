# AWS EC2 Provisioning with Terraform + Docker, kubectl & eksctl Bootstrap

This project demonstrates **end-to-end infrastructure provisioning on AWS using Terraform**, combined with a **bootstrap Bash script** to install **Docker**, **kubectl**, and **eksctl** on an EC2 instance.

It reflects a **real-world DevOps workflow** covering:
- Infrastructure as Code (IaC)
- Secure networking
- Remote Terraform state management
- Automated instance configuration
- EKS tooling readiness

---

## 🚀 Project Overview

Using Terraform, this project provisions:

- An **EC2 instance** in AWS
- A **Security Group** with SSH access
- A **50GB EBS data volume** attached to EC2
- **Remote Terraform state** stored in S3
- Automated software installation via **user_data**

At boot time, the EC2 instance installs:
- Docker Engine
- kubectl (EKS compatible)
- eksctl (latest)

---
## 📁 Repository Structure

- **provider.tf**
- **ec2.tf**
- **security_group.tf**
- **ebs.tf**
- **Docker_kubectl_eksctl_Install.sh**
- **README.md**

## 🧰 Technologies Used

- **Terraform**
- **AWS EC2**
- **AWS EBS**
- **AWS S3 (Remote State)**
- **Docker**
- **Kubernetes**
- **eksctl**
- **Bash**