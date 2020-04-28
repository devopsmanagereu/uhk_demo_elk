# uhk_demo_elk
ELK demo for UHK
- ELK - one server
- DEV - only one server
- IOP - 4 servers
- PROD - 8 servers

## Prerequisites
- Register to [digitalocean and get 100$ free credit](https://m.do.co/c/fa861033336b)
- Create [api access token](https://cloud.digitalocean.com/account/api/tokens)
- Put your [ssh key](https://cloud.digitalocean.com/account/security)

- Replace change_me_token with your api access token in all tf files (elk.tf, dev.tf, etc).
- Replace change_me_ssh_key with your ssh fingerprint in all tf files.

## ELK server preparation
```
cd terraform/digitalocean/elk
terraform apply --auto-approve
# replace all change_me_elk_ip to elk_ip (inventory_uhk_elk.ini, group_vars/all.yml)
cd ../../..
ansible-playbook -i inventory_uhk_elk.ini playbooks/uhk_elk.yml
```

## DEV server preparation
```
cd terraform/digitalocean/dev
terraform apply --auto-approve
# replace all change_me_dev_ip to dev_ip in inventory_uhk_dev.ini
cd ../../..
ansible-playbook -i inventory_uhk_dev.ini playbooks/uhk_dev.yml
```

## IOP / PROD servers preparation
```
cd terraform/digitalocean/iop
terraform apply --auto-approve
# replace all change_me_iop_<vm>_ip with terraform output in inventory_uhk_iop.ini
cd ../../..
ansible-playbook -i inventory_uhk_iop.ini playbooks/uhk_iop_prod.yml
```

# Gui access
- Control runs on port 8080
- Computation module runs on port 8081
- ActiveMQ gui runs on 8161
