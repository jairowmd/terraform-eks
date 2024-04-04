# cortando o oidc e pegando o 4 campo
locals {
  
  oidc = split("/", var.oidc)[4]

}