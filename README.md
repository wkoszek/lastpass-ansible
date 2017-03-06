# Unlock Ansible Vault with LastPass

[![Build Status](https://travis-ci.org/wkoszek/lastpass-ansible.svg?branch=master)](https://travis-ci.org/wkoszek/lastpass-ansible)

Script `lastpass-ansible` in this project will let you unlock [Ansible
Vault][] with the password stored in [LastPass][]. This means you'll be able
to run `ansible-playbook` and `ansible-vault` commands without being
prompted for the password: it'll be taken from LastPass automatically.

You can keep your Ansible Vault passwords along with your other
secrets in LastPass, and not worry about forgetting your passwords.
You should also use LastPass's strong password generator for your Ansible
Vault password.

The 'lastpass-ansible' is designed so that it integrates easily with your
existing flow.

# How to install

You install the tool in the terminal:

	gem install lastpass-ansible

# How to use

You must point Ansible to use `lastpass-ansible`:

	export ANSIBLE_VAULT_PASSWORD_FILE=`command -v lastpass-ansible`

Now assume you're in your web application directory:

	cd ~/Projects/my_web_app

To initialize everything, do:

	lastpass-ansible --init

This will create a new 30-character long password and put it in
`Ansible_Vault/my_web_app` LastPass hierarchy. If you want to "transfer" your vault
file `secrets.yml` to `lastpass-ansible`, copy the new password to clipboard:

	lpass show -c -p Ansible_Vault/my_web_app

And just re-key (change password) for your existing vault:

	ansible-vault rekey secrets.yml

Type your old password, and paste your new password.

File `.lastpass-ansible.conf` has been created along with the password. You
can remove this file if the hierarchy `Ansible_Vault/....` is fine with you.

# More details and custom settings

If you're a picky person and you don't like `Ansible_Vault` OR you want to
point `lastpass-ansible` to an existing hierarchy of Vaults, just stick it
to `.lastpass-ansible.conf`.  It's format is very easy:

	# lastpass-ansible configuration file. For more details read:
	# https://github.com/wkoszek/lastpass-ansible
	MyWebSites/my_web_app

The order of lookup for this LastPass site name is:

1. `.lastpass-ansible.conf` file
2. `LASTPASS_ANSIBLE_NAME` environment variable
3. Name guessed based on a directory: "Ansible_Vault" + name

It should be safe to commit `.lastpass-ansible.conf` to your repository.
If you're paranoid, just use `LASTPASS_ANSIBLE_NAME` environment variable
for passing this name. Otherwise just use the guessed name. I think it's the
most convenient.

[Ansible Vault]: http://docs.ansible.com/ansible/playbooks_vault.html
[LastPass]: https://www.lastpass.com

## Author

- Wojciech Adam Koszek, [wojciech@koszek.com](mailto:wojciech@koszek.com)
- [http://www.koszek.com](http://www.koszek.com)
