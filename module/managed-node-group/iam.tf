# criando role para o cluster
resource "aws_iam_role" "eks_mng_role" {
  name = "${var.project_name}-mng-role"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })


  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}-mng-role"

    }

  )

}

# adicionando permissoes a role
resource "aws_iam_role_policy_attachment" "eks__role-attachment_worker" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  

}

# adicionando permissoes a role
resource "aws_iam_role_policy_attachment" "eks__role-attachment_ecr" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  

}

# adicionando permissoes a role
resource "aws_iam_role_policy_attachment" "eks__role-attachment_cni" {
  role       = aws_iam_role.eks_mng_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  

}