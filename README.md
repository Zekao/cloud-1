# Cloud-1

First of all, be sure that you have awscli installed and configured with your credentials.

```bash
aws configure list
```

After that, you can launch the different playbooks, first of all the one that will create your stack

```bash
ansible-playbook stack_setup/create_stack.yml
ansible-playbook -i inventory.ini install-inception.yml
```

If you want to delete your stack, you can use the following command

```bash
ansible-playbook stack_setup/delete_stack.yml
```

