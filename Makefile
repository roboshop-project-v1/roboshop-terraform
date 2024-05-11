dev:
	rm -rf .terraform
	terraform init -backend-config=envdev/state.tfvars
	terraform apply -auto-approve -var-file=envdev/main.tfvars 
prod:
	rm -rf .terraform
	terraform init -backend-config=envprod/state.tfvars
	terraform apply -auto-approve -var-file=envprod/main.tfvars
