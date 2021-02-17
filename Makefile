cnf ?= ~/.aws/credentials
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))


TERRAFORM_VERSION=0.14.5



# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## Guia de parametros para utilização do script.
	##################################################################################
	##  Script criado para facilitar e padronizar a execução de comandos terraform	##
	##################################################################################
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)


.DEFAULT_GOAL := help


terraform-init: ## Cria estrutura de modulos usados pelo Terraform
	docker run --rm --name terraform -v $$PWD/:/home/ -v $$HOME/.ssh/:/root/.ssh/ -w /home/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY hashicorp/terraform:$(TERRAFORM_VERSION) init

terraform-plan: ## Mostrar o plano de criação da infraestrutura no Terraform
	docker run --rm --name terraform -v $$PWD/:/home/ -v $$HOME/.ssh/:/root/.ssh/ -w /home/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY hashicorp/terraform:$(TERRAFORM_VERSION) plan -out=tfplan

terraform-apply: ## Cria a estrutura planenjada no Terraform
	docker run --rm --name terraform -v $$PWD/:/home/ -v $$HOME/.ssh/:/root/.ssh/ -w /home/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY hashicorp/terraform:$(TERRAFORM_VERSION) apply -auto-approve

terraform-destroy: ## Destroi a  estrutura planenjada no Terraform
	docker run --rm --name terraform -v $$PWD/:/home/ -v $$HOME/.ssh/:/root/.ssh/ -w /home/ -e AWS_ACCESS_KEY_ID=$$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$$AWS_SECRET_ACCESS_KEY hashicorp/terraform:$(TERRAFORM_VERSION) destroy -auto-approve
