![Dynamic](https://img.shields.io/badge/Terraform-v0.14.8-green?style=flat-square&logo=terraform)
![Dynamic](https://img.shields.io/badge/docker-20.10.2-green?style=flat-square&logo=docker)

# Terraform + AWS

### Baixar Terraform
https://www.terraform.io/downloads.html


> Lembrando que para tudo funcionar, precisa setar as variaveis globais para o terraform conectar na AWS
```sh
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXX
```

### Para iniciar o projeto, faça o clone
```sh
git clone git@github.com:matheusmgon/terraform-awx.git
```

### Para rodar o projeto execute
```sh
terraform init; terraform apply -auto-approve
```

> Ao finalizar a criação da maquina, será informado em seu terminal o IP publico e o DNS publico e um NGINX para pode acessar.
