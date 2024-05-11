terraform {
  backend "s3" {}
}


variable "test" {}

output "name" {
  value = var.test
  
}