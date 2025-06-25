#######################
# General Config
#######################
variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name used for tagging AWS resources"
  type        = string
}

#######################
# Networking
#######################
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

#######################
# EC2 Launch Config
#######################
variable "instance_type" {
  description = "EC2 instance type for ECS container instances"
  type        = string
  default     = "t2.micro"
}

#######################
# Auto Scaling - Web Tier
#######################
variable "web_desired_capacity" {
  description = "Desired number of instances in Web Auto Scaling Group"
  type        = number
  default     = 1
}

variable "web_min_size" {
  description = "Minimum number of instances in Web Auto Scaling Group"
  type        = number
  default     = 1
}

variable "web_max_size" {
  description = "Maximum number of instances in Web Auto Scaling Group"
  type        = number
  default     = 2
}

#######################
# Auto Scaling - App Tier
#######################
variable "app_desired_capacity" {
  description = "Desired number of instances in App Auto Scaling Group"
  type        = number
  default     = 1
}

variable "app_min_size" {
  description = "Minimum number of instances in App Auto Scaling Group"
  type        = number
  default     = 1
}

variable "app_max_size" {
  description = "Maximum number of instances in App Auto Scaling Group"
  type        = number
  default     = 2
}

#######################
# RDS Configuration
#######################
variable "db_name" {
  description = "RDS database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

#######################
# Capacity Provider Strategy
#######################
variable "web_capacity_provider_name" {
  description = "Capacity Provider name for Web ECS Service"
  type        = string
  default     = "web-cp"
}

variable "app_capacity_provider_name" {
  description = "Capacity Provider name for App ECS Service"
  type        = string
  default     = "app-cp"
}

