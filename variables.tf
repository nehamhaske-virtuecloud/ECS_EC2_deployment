variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name used for tagging AWS resources"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the main VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "List of CIDR blocks for public subnets (Web Tier)"
  type        = list(string)
}

variable "private_subnet_cidr_app" {
  description = "List of CIDR blocks for private subnets (App Tier)"
  type        = list(string)
}

variable "private_subnet_cidr_db" {
  description = "List of CIDRs for RDS DB private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones (e.g., [\"ap-south-1a\", \"ap-south-1b\"])"
  type        = list(string)
}

######################
# Instance Type
######################
variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type"
}

######################
# Web ASG Capacity
######################
variable "web_desired_capacity" {
  default     = 1
  description = "Desired capacity for Web ASG"
}

variable "web_max_size" {
  default     = 2
  description = "Max size for Web ASG"
}

variable "web_min_size" {
  default     = 1
  description = "Min size for Web ASG"
}

######################
# App ASG Capacity
######################
variable "app_desired_capacity" {
  default     = 1
  description = "Desired capacity for App ASG"
}

variable "app_max_size" {
  default     = 2
  description = "Max size for App ASG"
}

variable "app_min_size" {
  default     = 1
  description = "Min size for App ASG"
}

######################
# RDS
######################
variable "db_name" {
  default     = "appdb"
  description = "The name of the RDS database"
}

variable "db_username" {
  default     = "admin"
  description = "Master username for the RDS"
}

variable "db_password" {
  description = "Master password for the RDS"
  type        = string
  sensitive   = true
}
