# Overview

This project provides an example of using [Packer](https://www.packer.io/) with [AWS Systems Manager (SSM) Session 
Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html) to build a new AMI. 
AWS SSM Session Manager provides a secure channel to access EC2 instances in an AWS account **without** the 
need to open inbound port 22 or bastion hosts for SSH access. To further improve security posture, VPC Endpoints can 
be created for AWS SSM and EC2 services to enable secure, internal communication with AWS service endpoints - without 
need for an Internet Gateway or Proxy Servers. 


# Pre-requisites 

In order to run this project successfully, you will need the following: 

- Local or virtual machine with terminal access
- Terraform CLI (optional)
- [Packer CLI](https://www.packer.io/downloads)
- AWS CLI
- [Session Manager plugin for AWS CLI](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)


# Installation 

You can use the Terraform configuration in this project to create a new VPC, Subnet, Security Groups, IAM 
Instance Profile and VPC Endpoints. Alternatively, if you have an existing AWS environment, you can skip 
the Terraform step, and run the Packer build directly. 

In order to run Packer build to create a new AMI, you must create a Packer variables file (.pkvars.hcl) and
specify values of all variables used in the Packer build file ([ami_build.pkr.hcl](ami_build.pkr.hcl)). 
Refer to the provided [sample file](ami_build.sample-pkrvars.hcl). To run the build, simply execute: 

```shell
packer build -var-file="variables.pkrvars.hcl" .
```

# License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2021 &copy; Sachin Hamirwasia
