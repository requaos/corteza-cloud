#cloud-config
users:
  - name: corteza
    groups:
      - sudo
      - docker
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    shell: /bin/bash
    home: /home/corteza
    lock_passwd: true
    ssh-authorized-keys:
      - ${userdata_sshkey}

disable_root: true

apt_update: true
package_update: true
package_upgrade: true
package_reboot_if_required: true
packages:
 - git
 - docker.io
 - docker-compose

write_files:
 - encoding: b64
   content: ${corteza_env}
   path: /opt/corteza/.env
 - encoding: b64
   content: ${corteza_compose}
   path: /opt/corteza/docker-compose.yml
 - encoding: b64
   content: ${corteza_nginx_custom_conf}
   path: /opt/corteza-nginx/custom.conf
 - encoding: b64
   content: ${corteza_nginx_compose}
   path: /opt/corteza-nginx/docker-compose.yml

runcmd:
 - cd /opt/corteza-nginx
 - docker-compose up -d
 - cd /opt/corteza
 - docker-compose up -d