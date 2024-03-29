
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