region               = "ap-south-1"
project_name         = "ecs-ec2-app"
vpc_cidr_block       = "10.0.0.0/16"

public_subnet_cidr        = ["10.0.1.0/24", "10.0.2.0/24"]           # For web tier
private_subnet_cidr_app   = ["10.0.3.0/24", "10.0.4.0/24"]           # For app tier
private_subnet_cidr_db    = ["10.0.5.0/24", "10.0.6.0/24"]           # For RDS DB tier

availability_zones        = ["ap-south-1a", "ap-south-1b"]
instance_type             = "t2.micro"

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
