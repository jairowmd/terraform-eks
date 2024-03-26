
# criando subnet availability_zone = "us-east-1a"
resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  # informado no arquivo var o cidr de referencia para o calculo
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "cursodevops-subnet-1a"
  }
}



# criando subnet availability_zone = "us-east-1b"
resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  # informado no arquivo var o cidr de referencia para o calculo
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "cursodevops-subnet-1b"
  }
}