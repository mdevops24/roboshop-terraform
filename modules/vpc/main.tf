##VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {
    Name = "${var.env}-vpc"
  }
}

##Subnets
resource "aws_subnet" "web" {
  count      = length(var.web_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "web-subnet"
  }
}

resource "aws_subnet" "app" {
  count      = length(var.app_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "app-subnet"
  }
}

resource "aws_subnet" "db" {
  count      = length(var.db_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "db-subnet"
  }
}

resource "aws_subnet" "public" {
  count      = length(var.public_subnets)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = {
    Name = "public-subnet"
  }
}


#RTB route tables
resource "aws_route_table" "public" {
  count      =  length(var.public_subnets)
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-rt"
  }
}

