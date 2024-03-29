# nat gateway

# primeiro registrando o  elastic ip
resource "aws_eip" "eks_ngw_eip_1a" {
  vpc = true

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}-eip-1a"

    }

  )
}


# primeiro registrando o  elastic ip
resource "aws_eip" "eks_ngw_eip_1b" {
  vpc = true

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}-eip-1b"

    }

  )
}



# Criando nat gateway 1a
resource "aws_nat_gateway" "eks_igw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}-ngw-1a"

    }

  )

}

# Criando nat gateway 1b
resource "aws_nat_gateway" "eks_igw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}-ngw-1b"

    }

  )

}

resource "aws_route_table" "eks_private_route_table_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_igw_1a.id
  }

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}priv-route-table-1a"

    }

  )

}



resource "aws_route_table" "eks_private_route_table_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_igw_1b.id
  }

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}priv-route-table-1b"

    }

  )

}