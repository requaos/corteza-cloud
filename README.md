Corteza Project

```
cd terraform
terraform plan -var "sshkey=$SSH_PUB_KEY" -var "jwt_secret=$JWT_SECRET" -var "build_hash=$(git rev-parse --short HEAD)" -var "token=$TOKEN"
terraform apply -var "sshkey=$SSH_PUB_KEY" -var "jwt_secret=$JWT_SECRET" -var "build_hash=$(git rev-parse --short HEAD)" -var "token=$TOKEN"
```
