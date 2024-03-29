# criando recurso de internet gateway
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}-igw"

    }

  )


}

# criando a route_table 

resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}-public-rtb"

    }

  )

}