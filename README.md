# TerraLaunch
# Terraform Project 🛠️🌐

#📖 Project Description
This repository contains Terraform configurations for provisioning and managing AWS infrastructure. The goal of this project is to provide a secure and scalable infrastructure foundation for small to mid-scale applications — all with a one-click deployment.

#🚀 Key Features
One-click provisioning of essential AWS resources
Secure by design: Instances are deployed in private subnets and accessed via a Bastion host
Highly available and scalable using Auto Scaling Groups (ASG)
Modular and reusable Terraform code for ease of customization

#🔧 Provisioned AWS Resources
VPC with public and private subnets for network isolation
EC2 Instances in private subnets (accessible only via Bastion)
RDS Database in a private subnet for secure data storage
Application Load Balancer (ALB) in a public subnet for routing external traffic
Auto Scaling Group (ASG) for horizontal scaling
Security Groups configured to allow:
SSH access to private instances through a Bastion host
Public HTTP/HTTPS access to applications via the ALB
This setup ensures that application servers are not directly exposed to the internet, while still allowing users to access the app through a public ALB endpoint

## 🚧 Still in Progress

This project is currently **under development** and may not yet be fully functional. Contributions and feedback are welcome!

## 📋 Overview

This project includes Terraform modules and configurations to manage various resources such as:

- EC2 instances 🖥️ - ASG,ALB
- VPCs 🌍
- RDS databases 🗃️
- Security groups 🔒
- And more!

## 🛠️ Prerequisites

Before running the Terraform code, make sure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) 🏗️
- [AWS CLI](https://aws.amazon.com/cli/) (if deploying to AWS) ☁️
- [An AWS account](https://aws.amazon.com/) 🌐

## ⚙️ Setup

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/terraform-project.git
    cd terraform-project
    ```

2. Configure your AWS credentials (if deploying to AWS):

    ```bash
    aws configure
    ```

3. Initialize Terraform:

    ```bash
    terraform init
    ```

4. Review the Terraform plan:

    ```bash
    terraform plan
    ```

5. Apply the Terraform plan to create the resources:

    ```bash
    terraform apply
    ```

## 📦 Modules

This project is organized into reusable Terraform modules located in the `modules/` directory. These modules can be used independently or combined to create your infrastructure.

- `modules/alb/` - Module for managing AWS Application Load Balancers ⚖️
- `modules/ec2/` - Module for managing AWS EC2 instances 💻
- `modules/rds/` - Module for managing AWS RDS instances 📦
- `modules/security-group/` - Module for managing security groups 🔐
- `modules/vpc/` - Module for managing VPCs 🌍

## 📝 Variables

Each module may have a set of input variables defined in `variables.tf`. You can customize the module's behavior by overriding these variables in your `terraform.tfvars` file.

Example of a `terraform.tfvars` file:

```hcl
aws_region = "us-east-1"
instance_type = "t2.micro"
