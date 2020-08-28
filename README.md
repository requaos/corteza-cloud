# Corteza Project: On DigitalOcean

### This project is designed to work with a local file `terraform/variables.auto.tfvars`:
```
token = "digital-ocean-api-token"
domain = "example.com"
smtp_host = "super-secret-smtp-hostname:port-number"
smtp_user = "super-secret-smtp-users-username"
smtp_password = "super-secret-smtp-users-password"
jwt_secret = "your-greater-than-thirty-character-javascript-web-token-secret"
```

### This project assumes you are working in a *nix environment
- Have [Terraform](https://terraform.io) installed
- Have a [DigitalOcean](https://digitalocean.com) account and have generated an [API Key](https://cloud.digitalocean.com/account/api/tokens)
- Have a domain name configured with DigitalOcean's nameserver addresses.
- Have a public ssh key at `~/.ssh/id_rsa.pub`

### Terraform
Terraform is a stateful language, and it has multiple backends in which you can store your "remote state". The configuration in this repository assumes there is no remote state backend and will store all project state locally in `terraform/.terraform`

#### To observe the changes that would be applied to your account:
```
make plan
```

#### To apply those changes, effectively deploying the application:
```
make apply
```

#### To destroy all of the resources that you have just created:
```
make destroy
```

# Known Issues
- Database migration up scripts contain a table definition that is missing a primary key, which is rejected by the managed mysql cluster instance due to a security configuration.
  - Workaround SQL Script
  ```
  CREATE TABLE sys_actionlog (
      id bigint unsigned NOT NULL,
      ts datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      actor_ip_addr varchar(15) NOT NULL,
      actor_id bigint unsigned DEFAULT NULL,
      request_origin varchar(32) NOT NULL,
      request_id varchar(64) NOT NULL,
      resource varchar(128) NOT NULL,
      action varchar(64) NOT NULL,
      error varchar(64) NOT NULL,
      severity smallint NOT NULL,
      description text,
      meta json DEFAULT NULL,
      PRIMARY KEY (id),
      KEY ts (ts DESC),
      KEY request_origin (request_origin),
      KEY actor_id (actor_id),
      KEY resource (resource),
      KEY action (action) );

  UPDATE migrations SET status='ok' WHERE filename='/20200508070000.actionlog.up.sql';