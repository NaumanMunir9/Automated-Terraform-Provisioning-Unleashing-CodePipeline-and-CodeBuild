# Automated Terraform Provisioning: Unleashing CodePipeline and CodeBuild

![Automated Terraform Provisioning: Unleashing CodePipeline and CodeBuild - Thumbnail](/architecture-diagram/YT-Thumbnail- Automated%20Terraform%20Provisioning_%20Unleashing%20CodePipeline%20and%20CodeBuild.png)

---

## Architecture Diagram

![Automated Terraform Provisioning: Unleashing CodePipeline and CodeBuild - Architecture](/architecture-diagram/Automated%20Terraform%20Provisioning:%20Unleashing%20CodePipeline%20and%20CodeBuild.png)

---

## Introduction

Welcome to our comprehensive guide on **Automated Infrastructure Provisioning with Terraform, CodePipeline, and CodeBuild**! In this repository, we will walk you through the process of setting up a robust and scalable 3-tier architecture on Amazon Web Services (AWS) using Terraform for infrastructure management and AWS CodePipeline combined with CodeBuild for automated deployment.

---

## Problem Statement and Solution

### Problem Statement

Modern application development demands efficient and consistent infrastructure provisioning. However, the process of setting up complex architectures and maintaining them manually can be time-consuming, error-prone, and hard to replicate across environments. This often leads to inconsistencies, configuration drifts, and deployment bottlenecks.

### Solution

Our solution tackles these challenges head-on by leveraging the power of infrastructure as code (IaC) through Terraform and automating the deployment pipeline with AWS CodePipeline and CodeBuild. By following this tutorial, you'll learn how to create a 3-tier architecture (Web, App, DB) on AWS using Terraform, incorporating best practices for security, scalability, and maintainability.

Here's a glimpse of what we'll cover:

1. **VPC Creation and Configuration:** We'll start by setting up a Virtual Private Cloud (VPC) with well-defined subnets for different tiers of your application. This creates an isolated network environment for your resources.

2. **Security Group Management:** Learn how to create and manage AWS Security Groups to control inbound and outbound traffic for various components, ensuring a secure network architecture.

3. **Instance Setup:** We'll guide you through the process of deploying private EC2 instances for your application, a bastion host for secure access, and the necessary network configurations like NAT Gateway and Elastic IP.

4. **Load Balancing:** Understand the importance of load balancing for distributing traffic efficiently. We'll create an Application Load Balancer and configure target groups to balance incoming requests across your application instances.

5. **Auto Scaling:** Discover how to set up Auto Scaling for your application using Launch Templates, ensuring your application can dynamically handle varying workloads.

6. **Infrastructure as Code:** Dive deep into Terraform to define your entire infrastructure as code. This approach allows you to version-control your infrastructure, replicate it across environments, and ensure consistency.

7. **Pipeline Automation:** Learn how to create a fully automated deployment pipeline using AWS CodePipeline. We'll define separate environments for Development and Staging, enabling continuous integration and delivery.

8. **CodeBuild Integration:** Understand the role of CodeBuild in building and testing your infrastructure code before deployment. We'll create distinct build specifications for Development and Staging environments.

In this repository, you'll find step-by-step instructions, code samples, and configuration files that align with best practices and industry standards. By the end of this tutorial, you'll have gained valuable insights into automating your infrastructure provisioning, making your deployments more reliable, repeatable, and efficient.

Whether you're a seasoned DevOps engineer or a developer new to infrastructure automation, this tutorial will equip you with the knowledge and skills to streamline your application deployment process using Terraform, AWS CodePipeline, and CodeBuild. Let's dive in and empower your projects with automated infrastructure provisioning!

Feel free to explore the provided resources, follow along with the tutorial, and adapt the concepts to your own projects. If you have any questions or need assistance, don't hesitate to reach out. Happy automating!

---

## Steps

### Create S3 Bucket for Terraform State Storage

- S3 Bucket
  - **Bucket Name**: `aws-codepipeline-codebuild-iac-terraform-mnm`
  - **Create Folder**:
    - `iac-aws-terraform`
    - `iac-aws-terraform\dev`
    - `iac-aws-terraform\stag`

### Create DynamoDB Tables for Terraform State Locking

- Create Dynamo DB Table for Dev Environment
  - **Table Name**: `iac-aws-terraform-dev-tfstate`
  - **Partition key (Primary Key)**: `LockID` (String)

- Create Dynamo DB Table for Staging Environment
  - **Table Name**: `iac-aws-terraform-stag-tfstate`
  - **Partition key (Primary Key)**: `LockID` (String)

### Create Parameters in Parameter Store

#### Create MY_AWS_ACCESS_KEY_ID

- Systems Manager -> Parameter Store -> Create Parameter
  - **Name**: `/CodeBuild/MY_AWS_ACCESS_KEY_ID`
  - **Descritpion**: `AWS Access Key ID`
  - **Tier**: Standard
  - **Type**: Secure String
  - **Value**: XXXXXXXXXXXXX

#### Create MY_AWS_SECRET_ACCESS_KEY

- Systems Manager -> Parameter Store -> Create Parameter
  - **Name**: `/CodeBuild/MY_AWS_SECRET_ACCESS_KEY`
  - **Descritpion**: `AWS Secret Access Key`
  - **Tier**: Standard
  - **Type**: Secure String
  - **Value**: XXXXXXXXXXXXX

### AWS Connector for GitHub

### AWS Developer Tools - Github Connection

- AWS Developer Tools -> Settings -> Connections -> Create Connection
  - **Select Provider**: `Github`
  - **Connection Name**: `aws-github-connection-cicd-mnm`
  - **GitHub Apps**: `Install new app`

### Create AWS CodePipeline

- CodePipeline -> Create Pipeline
  - **Pipeline Name**: `aws-codepipeline-iac-tf-mnm`

#### Build Stage - Dev

- **Build Name**: `aws-codebuild-dev-iac-tf-mnm`

#### Update IAM Role for Dev - `ssm:GetParameters`

- Attach Policy to IAM Role

### Add Email Approval Stage

- **Name**: `Email-Approval`

### Build Stage - Staging

- **Name**: `Build-Staging`
  - CodeBuild Name: `aws-codebuild-stag-iac-tf-mnm`

#### Update IAM Role for Staging - `ssm:GetParameters`

- Attach Policy to IAM Role

### Destroy Resources

- **TF_COMMAND**: `destroy`

---
