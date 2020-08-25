

SECRETS=""
ifeq (,$(wildcard ./secrets.sh))
    SECRETS=source ./secrets.sh
endif

BUILD_HASH=$(shell git rev-parse --short HEAD)

plan:
	${SECRETS} && cd terraform && echo terraform plan -var "sshkey=${SSH_PUB_KEY}" -var "jwt_secret=${JWT_SECRET}" -var "build_hash=${BUILD_HASH}" -var "token=$TOKEN" && cd ..