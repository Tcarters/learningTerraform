# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  default     = "ap-south-1" #us-west-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro" # size of image
}

variable "instance_name" {
  description = "vm-nonprod-O1"  #"EC2 instance name"
  default     = "Provisioned by Terraform"
}
