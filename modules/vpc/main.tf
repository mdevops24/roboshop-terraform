resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "web" {
  count      = length(var.web_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "web-subnet"
  }
}

resource "aws_subnet" "web" {
  count      = length(var.web_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "web-subnet"
  }
}
