variable "availability_zone" {
  default     = "us-east-1a"
  description = "Availability zones for launching the Vault instances"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type for Vault instances"
}

variable "key_name" {
  default     = "default"
  description = "SSH key name for Vault instances"
}

variable "servers" {
  default     = "3"
  description = "number of Vault instances"
}

variable "subnet" {
  description = "list of subnets to launch Vault within"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "resource_tags" {
  type        = map(string)
  default     = {}
  description = "Resource Tags. Get applied anywhere tags can be applied"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "inbound_ssh_cidr_block" {}

variable "agent_version" {}

variable "agent_name" {}

variable "tfc_agent_token" {}

variable "tfc_agent_pool" {}
variable "tfc_org_name" {}