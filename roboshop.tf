resource "aws_instance" "frontend" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-0490a4409ed09ba21"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z05459522TM73CF1WNKI7"
  name    = "frontend.jdevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}


resource "aws_instance" "mongodb" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-0490a4409ed09ba21"]

  tags = {
    Name = "mongodb"
  }
}


resource "aws_route53_record" "mongodb" {
  zone_id = "Z05459522TM73CF1WNKI7"
  name    = "mongodb.jdevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}





resource "aws_instance" "catalogue" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-0490a4409ed09ba21"]

  tags = {
    Name = "catalogue"
  }
}


resource "aws_route53_record" "catalogue" {
  zone_id = "Z05459522TM73CF1WNKI7"
  name    = "catalogue.jdevops.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}