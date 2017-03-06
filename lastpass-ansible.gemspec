Gem::Specification.new do |s|
  s.name        = 'lastpass-ansible'
  s.version     = '1.0.2'
  s.summary     = "Use LastPass to unlock Ansible Vault"
  s.description = "The #{s.name} lets you unlock Ansible Vault with password from LastPass"
  s.authors     = ["Wojciech Adam Koszek"]
  s.email       = "wojciech@koszek.com"
  s.homepage    = "http://github.com/wkoszek/#{s.name}"
  s.files       = ["bin/#{s.name}"]
  s.executable	= "#{s.name}"
  s.require_paths = ['.']
  s.license	= 'BSD-2-Clause'
end
