
# criando subnets privadas availability_zone = "us-east-1a"
resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id = aws_vpc.eks_vpc.id
  # informado no arquivo var o cidr de referencia para o calculo
  cidr_block = cidrsubnet(var.cidr_block, 8, 3)
  # variavel em region.tf
  availability_zone = "${data.aws_region.current.name}a"



  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    local.tags,

    {

      Name                             = "${var.project_name}-priv-subnet-1a",
      "kubernets.io/role/internal-elb" = 1

    }

  )

}




# criando subnet availability_zone = "us-east-1b"
resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id = aws_vpc.eks_vpc.id
  # informado no arquivo var o cidr de referencia para o calculo
  cidr_block = cidrsubnet(var.cidr_block, 8, 4)
  # variavel em region.tf
  availability_zone = "${data.aws_region.current.name}b"

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    local.tags,

    {

      Name                             = "${var.project_name}-priv-subnet-1b",
      "kubernets.io/role/internal-elb" = 1

    }

  )
}

# criando route_table_association para linkar a subnet com a route table


resource "aws_route_table_association" "eks_rtb_assoc_priv_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}

resource "aws_route_table_association" "eks_rtb_assoc_priv_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_private_route_table_1b.id
}