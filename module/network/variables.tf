variable "cidr_block" {
  type        = string
  description = "networking cidr block to be used for the VPC"
}

variable "project_name" {
  type        = string
  description = "Project name to be used in to name the resources (Name tag)"
}



variable "tags" {
  type = map
  description = "Tags to be added to AWS resouces (Name tag)"
  
}