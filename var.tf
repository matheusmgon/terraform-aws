variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "libera_ip" {
  type  = list
  default = ["IP/32"]  
}

variable "security_group_id" {
  description = "Security group ID Existente na AWS"
  type  = list
  default = ["sg-XXXXX"]
}

variable "vpc_id" {
  description = "VPC ID Existente na AWS"
  type  = string
  default = "vpc-XXXXX"
}

variable "key_name" {
  description = "Nome da chave publica"  
  default = "Notebook Matheus Key"
}

variable "public_key" {
  description = "Chave publica para conexão SSH"
  default =  "ssh-rsa XXXXX"
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