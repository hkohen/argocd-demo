# GitOps Project
---
## IaC Development for Deploy Argo with Terraform and Helm.
## Terraform Project
[Terraform install](https://developer.hashicorp.com/terraform/downloads)   
- [x] terraform binaries.
- [x] helm provider tf code.
- [x] helm resource tf code.

### Below you can find the commands for terraform.
```bash
terraform -version
terraform init
terraform plan
terraform apply
```
After applying, you need to choose yes or no:

```bash
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
```
Its necesary to check the status of the deployment.
```bash
helm list -A
```
## Helm Project
[Helm Install](https://helm.sh/docs/intro/install)
- [x] helm binaries.
- [x] helm repository.
### Below you can find the commands for helm.
```bash
helm repo list
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm search repo argocd
helm show values argo/argocd --version 3.35.4 > argocd-defaults.yaml
```
### Argo Project
- [x] argocd binaries.
- [x] argocd resources.

-  Check out the yaml secrets
-  [x] yaml
```bash
kubectl  get secrets argocd-initial-admin-secret -o yaml -n argocd
```
- Check the password obtained from the secret file.
```bash
kubectl  get secret argocd-initial-admin-secret -n argocd --output jsonpath="{.data.password}" | base64 --decode
```