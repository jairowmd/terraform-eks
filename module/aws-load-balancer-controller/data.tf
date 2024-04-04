# pegando dados via api da aws para usar no iam role do load balancer controller
data "aws_caller_identity" "current" {}

data "aws_region" "current" {

}