#Minimum Configuration
module "ec2_instance" {
    source = "github.com/jakeasarus/terraform/ec2_server_2019_use1/"
}

#Updating Availability Zone
module "ec2_instance" {
    source = "github.com/jakeasarus/terraform/ec2_server_2019_use1/"
    availability_zone = var.availability_zone #make sure to add to variables
}