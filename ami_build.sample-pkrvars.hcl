# this is a sample variables file for packer build file ami_build.pkr.hcl

profile                 = "default"
region                  = "us-east-2"
app_name                = "PackerBuildUsingSSM"
ec2_sg_id               = "sg-0abc909959823bd3a"
ec2_instance_profile    = "pbssm-ec2-instance-profile-20210428221342315900000003"
vpc_id                  = "vpc-03b5b1c31ea607bec"
subnet_id               = "subnet-00993ad028a150e6c"
