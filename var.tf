variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "libera_ip" {
  type  = list
  default = ["189.6.245.149/32"]  
}

variable "security_group_id" {
  description = "Security group ID Existente na AWS"
  type  = list
  default = ["sg-9ca1dfc2"]
}

variable "vpc_id" {
  description = "VPC ID Existente na AWS"
  type  = string
  default = "vpc-a59af7dd"
}

variable "key_name" {
  description = "Nome da chave publica"  
  default = "Notebook Matheus Key"
}

variable "public_key" {
  description = "Chave publica para conexão SSH"
  default =  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWzf0Nt+lSQXHZxPJM557DJ4oJO1E5nGcG0bKKa77g2bprGSBNvfj+xfMXkIhomJhUeVaTzCeOJT6w/vzb/RavRHpVPYm9y+FvTP8YHG8mWhzO2BfVDOWjvfM8lU8G76qV++9J+tBj5+VbJtxgH03jPnjcN/WM8DC2DYaseofN83/yK4SWgdY+w7GUN/6ET8o0W4VIGxl2SngE5+ctprTVWewFPiHh+3dkO83IfhOsdxuGAyex+1x1MV1dr5qDO3Uf9snNDhXZ0ZQ3YyQFEtYEa23UltfFYK1pUjw1pdB27TkDteuSdom7ksm/0Rn6hwIHBczulVd0xonRdvqVGVoRvYLrZnWKYlH1gkgnvyx6XQalHX9yhn/sGkzhZFAjwU5MJaMGhwJV0M+HHO8YzFuUNllMaQhMYIvUB3VzvdRhQX1ixEacULKotAhSkInar4G/c3Nz9ON1i/JMG3yZmjIJfZd95KNwFj1MCEjXm6AMZ97kbHwtgYuTBzx9uNfnfk8= matheus@mGon"
}

variable "ami_debian_buster" {
  description = "debian buster Sao Paulo"
  default = "ami-0db1eceb266f74f38"
}
variable "quantidade_instancias" {
  description = "Quantidade de maquinas"
  default = 1
}
variable "tipo_instancia" {
  description = "Configuração de hardware da instancia"
  default = "t2.nano"
}