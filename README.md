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

Now do:

	lastpass-ansible --init

This will create a new "site" in LastPass in the hierarchy `Ansible_Vault/my_web_app`.
It'll also generate a 30-character password for this site.

**If you want to stick to your current Vault password**

Just go to LastPass, edit the site in `Ansible_Vault/my_web_app` and put your password there. Save.

**If you want to use the new password:**

	lpass show -c -p Ansible_Vault/my_web_app
	ansible-vault rekey secrets.yml

First command copies the newly generated password to the clipboard, and the second one will replace the old password with the new one. It's so called re-keying the Vault. Clear the clipboard afterwards.


# More details and custom settings

File `.lastpass-ansible.conf` has been created along with the password. It just
tells `lastpass-ansible` which LastPass site to use to get the proper password.
If you're fine with `Ansible_Vault/...`, then you can remove this file. It's a
default lookup location.

If you're a picky person and you don't like `Ansible_Vault` OR you want to
point `lastpass-ansible` to an existing hierarchy of sites in LastPass, just stick it
to `.lastpass-ansible.conf`.  It's format is very easy:

	# lastpass-ansible configuration file. For more details read:
	# https://github.com/wkoszek/lastpass-ansible
	MyWebSites/my_web_app

And it'll work. The order of lookup for this LastPass site name is:

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
