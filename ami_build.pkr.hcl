variable "profile" {}
variable "region" {}
variable "app_name" {}
variable "ec2_sg_id" {}
variable "ec2_instance_profile" {}
variable "vpc_id" {}
variable "subnet_id" {}

source "amazon-ebs" "ec2_ami" {
  profile                   = var.profile
  region                    = var.region
  ami_name                  = "${var.app_name}-{{timestamp}}"
  force_deregister          = true

  instance_type             = "c5.large"
  source_ami_filter {
      filters = {
        virtualization-type = "hvm"
        name                = "amzn2-ami-hvm-2*"
        root-device-type    = "ebs"
        architecture        = "x86_64"
      }
      owners                = ["amazon"]
      most_recent           = true
  }

  vpc_id                    = var.vpc_id
  subnet_id                 = var.subnet_id
  security_group_id         = var.ec2_sg_id 

  communicator              = "ssh"           # uses ssh via session manager connection tunnel 
  ssh_interface             = "session_manager"
  ssh_username              = "ec2-user"      # must use ec2-user on AL2 for ssh access
  iam_instance_profile      = var.ec2_instance_profile
}

build {
  sources = [
    "source.amazon-ebs.ec2_ami"
  ]

  provisioner "shell" {
    script                  = "ami_provisioner.sh"
  }
}
