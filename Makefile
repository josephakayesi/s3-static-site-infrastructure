.PHONY: run

init: 
	@echo "initializing terraform..."
	terraform init

plan:
	@echo "planning infrastructure..."
	terraform plan

apply:
	@echo "provisioning infrastructure..."
	terraform apply -auto-approve

destroy:
	@echo "destroying infrastructure..."
	terraform destroy -auto-approve

output:
	@echo "showing infrastructure outputs..."
	terraform output