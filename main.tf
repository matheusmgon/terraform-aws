provider "aws"{
  region = var.region
}
#Template para instlar Nginx
data "template_file" "nginx" {
  template = file("./instalar-nginx.sh")
}
#Adicionando chave SSH
resource "aws_key_pair" "ssh_key"{
  key_name = var.key_name
  public_key = var.public_key
}

#Chamando o security group
resource "aws_security_group" "secgroup" {
  name = "secgroup"
  description = "secgroup"
  vpc_id      = var.vpc_id
}

#Liberando acesso SSH a IP específico
resource "aws_security_group_rule" "SSH" {
  type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.libera_ip
    security_group_id = aws_security_group.secgroup.id
}

#Regra para liberar acesso HTTP
resource "aws_security_group_rule" "HTTP" {
  type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.secgroup.id
}

#Regra para ter acesso a internet
resource "aws_security_group_rule" "conexão-internet" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    security_group_id = aws_security_group.secgroup.id
}


resource "aws_instance" "instancia" {
  #Selecionando SO
  ami = var.ami_debian_buster 
  #Informando hardwar
  instance_type = var.tipo_instancia
  #Informando chave SSH
  key_name  = var.key_name
  #Quantidade de maquinas
  count = var.quantidade_instancias
  #Tags de identificação
  tags = {
    type  = "instancia"
    name  = "debian-buster"
  }
  #Setando security group
  security_groups = [aws_security_group.teste-secgroup.name]
  #Aplicando template do Nginx
  user_data = data.template_file.nginx.rendered
}









# ingress = [{
#   # cidr_blocks = [data.aws_vpc.vpc-teste.cidr_block]
#   # ipv6_cidr_blocks = [data.aws_vpc.vpc-teste.ipv6_cidr_block]
#   # prefix_list_ids = [ "pl-68a54001" ]
#   # security_groups = ["sg-9ca1dfc2"]
#   # self = false
#   cidr_blocks = var.libera_ip
#   description = "Liberação de Porta SSH para IP específico"
#   from_port = 22
#   protocol = "tcp"
#   to_port = 22
# }]
