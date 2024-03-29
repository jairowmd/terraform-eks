
# criando recuros - resource - "nome official" "Apelido"

resource "aws_vpc" "eks_vpc" {
  cidr_block = var.cidr_block
  # habilita suporte a dns na VPC
  enable_dns_support = true
  # habilita suporte a hostnames no DNS da vpc
  enable_dns_hostnames = true

  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    local.tags,

    {

      Name = "${var.project_name}-vpc"

    }

  )

}