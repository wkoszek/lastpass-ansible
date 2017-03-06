# Unlock Ansible Vault with LastPass

[![Build Status](https://travis-ci.org/wkoszek/lastpass-ansible.svg?branch=master)](https://travis-ci.org/wkoszek/lastpass-ansible)

Script `lastpass-ansible` in this project will let you unlock [Ansible
Vault][] with the password stored in [LastPass][]. This means you'll be able
to run `ansible-playbook` and `ansible-vault` commands without being
prompted for the password: it'll be taked from LastPass automatically.

You can keep your Ansible Vault passwords along with your other
secrets in LastPass, and not worry about forgetting your passwords.
You should also use LastPass's strong password generator for your Ansible
Vault password.

# How to use?

Install the tool in the terminal:

	gem install lastpass-ansible

To use it:

1. Generate a password in Ansible by adding a new site or secure note
2. Give it a name and save it.
3. Put the name of this site in `.lastpass-ansible.conf`

**Example**

Let's create a "site" with a separate password:

![screenshot](doc/lastpass_ansible.png)

In the top directory of your project:

	$ pwd
	/Users/wk/r/lnkr_xyz

You'd do:

	echo ansible_vault_lnkr_xyz > .lastpass-ansible.conf
	git add .lastpass-ansible.conf
	git commit -m "Add lastpass-ansible config to the project" .lastpass-ansible.conf

The `lastpass-ansible` will take this name, and use `lpass` (the
[LastPass command line][] utility) and lookup its database of password, then
pass it to Vault and unlock it.

[Ansible Vault]: http://docs.ansible.com/ansible/playbooks_vault.html
[LastPass]: https://www.lastpass.com

## Author

- Wojciech Adam Koszek, [wojciech@koszek.com](mailto:wojciech@koszek.com)
- [http://www.koszek.com](http://www.koszek.com)
