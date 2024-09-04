### Migrate 3 Tier Application

- initialize Terraform

```
bash
terraform init
```

- Validate Resouces

```
bash
terraform plan
```

- Spin up Resouces

```
bash
terraform apply
```

- Destroy Resouces

```
bash
terraform destroy
```

- Copy Private Key to File

```
bash
terraform output -raw ssh_private_key > id_rsa
```

- SSH into VM

```
bash
ssh -i id_rsa <admin_username>@<public_ip_address>
```

### Install Configration using Ansible

Changes to be made : ansible_host in hosts.ini

```
ansible-playbook -i hosts.ini deploy.yml
```
