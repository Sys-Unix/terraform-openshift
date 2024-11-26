# Terraform OpenShift na AWS

Este projeto implementa um cluster OpenShift na AWS usando Terraform.

## Pré-requisitos

- Terraform >= 1.0
- AWS CLI configurado
- Conta AWS com permissões adequadas
- Red Hat OpenShift Pull Secret

## Estrutura do Projeto

O projeto está organizado em módulos:
- VPC: Configuração de rede
- Security: Grupos de segurança
- IAM: Roles e políticas
- OpenShift: Configuração do cluster

## Como usar

1. Clone o repositório
2. Configure suas credenciais AWS
3. Ajuste as variáveis em terraform.tfvars
4. Execute:
```
terraform init
terraform plan
terraform apply
```

## Variáveis

| Nome | Descrição | Tipo | Padrão |
|------|-----------|------|--------|
| region | Região AWS | string | us-east-1 |
| cluster_name | Nome do cluster | string | - |
| environment | Ambiente (dev/prod) | string | dev |

## Outputs

- Cluster ID
- Console URL
- Kubeconfig