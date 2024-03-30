variable "project_name" {
  type        = string
  description = "Project name to be used in to name the resources (Name tag)"
}



variable "tags" {
  type = map
  description = "Tags to be added to AWS resouces (Name tag)"
  
}


variable "public_subnet_1a" {
  type = string
  description = " Subnet to create EKS cluster AZ 1a"
  
}

variable "public_subnet_1b" {
  type = string
  description = " Subnet to create EKS cluster AZ 1b"
  
}