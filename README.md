# Terraform 3-Tier Architecture

## Project Overview

This project uses Terraform to create a 3-tier architecture consisting of:

- **VPC**: Custom Virtual Private Cloud with public and private subnets  
- **Security**: Security groups and network ACLs for controlled access  
- **Web Tier**: Instances serving web traffic  
- **App Tier**: Backend application servers  
- **DB Tier**: Database instances for persistent storage  

Each tier is organized into separate Terraform modules for modularity and ease of management.

## Project Structure
```
├── main.tf
├── variables.tf
├── teraform.tfvars
├── vpc/
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
├── security/
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
├── web/
│   ├── main.tf
│   └── variables.tf
├── app/
│   ├── main.tf
│   └── variables.tf
├── db/
│   ├── main.tf
│   └── variables.tf
```

## Usage

1. Initialize Terraform:  
   ```bash
   terraform init
   terraform validate
   terraform plan 
   terraform apply 
   terraform destroy 

## ✅ Features

- Custom VPC with Public, Private, App, and DB subnets
- Internet Gateway and NAT Gateway setup
- Secure EC2 instances for Web and App layers
- Load Balancer in front of the Web tier
- RDS instance in private subnet for DB tier
- Separate modules for better code organization

## 🚀  How to Use

> Make sure you have Terraform installed and configured with AWS credentials.

1. Clone this repo:

git clone https://github.com/Sank-Gaikwad/Terraform-3-tier.git

Terraform-3-tier
```
terraform init
terraform plan
terraform apply
terraform destroy
```
🔐 Security
IAM credentials are never hardcoded.

Sensitive values are managed using .tfvars and not committed to GitHub.

✍️ Author
Sanket Gaikwad
DevOps | AWS | Terraform Enthusiast







