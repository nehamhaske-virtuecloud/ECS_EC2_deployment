region               = "ap-south-1"
project_name         = "app-ecs-ec2"
vpc_cidr_block       = "10.0.0.0/16"

# Subnets
public_subnet_cidr        = ["10.0.1.0/24", "10.0.2.0/24"]           # Web Tier
private_subnet_cidr_app   = ["10.0.3.0/24", "10.0.4.0/24"]           # App Tier
private_subnet_cidr_db    = ["10.0.5.0/24", "10.0.6.0/24"]           # RDS Tier

# AZs
availability_zones        = ["ap-south-1a", "ap-south-1b"]

# EC2 Instance Type
instance_type             = "t2.micro"
key_name             = "my-key-pair"

# Web Tier ASG Capacity
web_desired_capacity      = 1
web_min_size              = 1
web_max_size              = 2

# App Tier ASG Capacity
app_desired_capacity      = 1
app_min_size              = 1
app_max_size              = 2

# RDS
db_password               = "AdminPassword#123"
db_name                   = "appdb"
db_username               = "admin"

# ECS Capacity Provider Names
web_capacity_provider_name = "web-cp"
app_capacity_provider_name = "app-cp"
