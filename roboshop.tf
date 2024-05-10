variable "ami" {
  default = "ami-0f3c7d07486cad139"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_security_group_ids" {
  default = ["sg-0490a4409ed09ba21"]
}

variable "zone_id" {
  default = "Z05459522TM73CF1WNKI7"
  
}

variable "components" {

  default = {
      frontend  = {},
      mongodb   = {},
      catalogue = {},
      redis     = {},
      user      = {},
      cart      = {},
      mysql     = {},
      shipping  = {},
      rabbitmq  = {},
      payment   = {}

  }

}

resource "aws_instance" "instance" {

  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = each.key
  }
}



resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${each.key}.jdevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.key].private_ip]
}
