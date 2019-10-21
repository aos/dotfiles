### Ansible Playbook for Creating User

Uses `ansible-vault` to encrypt the `hosts` and `vars/main.yml` file. To edit,
run command:
```
$ ansible-vault edit <file>
```


### Usage

```
$ ansible-playbook --ask-vault-pass -i hosts --private-key=<ssh_key> main.yml
```
