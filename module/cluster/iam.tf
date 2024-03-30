# criando role para o cluster
resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-cluster-role"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })


  # estou fazendo um merge da tag do recurso com as definidas no locals.tf
  tags = merge(

    var.tags,

    {

      Name = "${var.project_name}-cluster-role"

    }

  )

}

# adicionando permissoes a role
resource "aws_iam_role_policy_attachment" "eks_cluster_role-attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}