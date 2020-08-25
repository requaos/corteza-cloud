SHELL=/bin/bash
BUILD_HASH=$(shell git rev-parse --short HEAD)
SSH_KEY=$(shell cat ~/.ssh/id_rsa.pub)

plan:
	@cd terraform && \
	sudo terraform init && \
	sudo terraform plan -var "sshkey=${SSH_KEY}" -var "build_hash=${BUILD_HASH}" && \
	cd ..

apply:
	@cd terraform && terraform apply -var "sshkey=${SSH_KEY}" -var "build_hash=${BUILD_HASH}" && cd ..

destroy:
	@cd terraform && terraform destroy -var "sshkey=${SSH_KEY}" -var "build_hash=${BUILD_HASH}" && cd ..