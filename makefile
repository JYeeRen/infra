pve:
	ansible-playbook -b main.yaml --skip-tags vgpu --limit pve

reqs:
	ansible-galaxy install -r requirements.yaml

forcereqs:
	ansible-galaxy install -r requirements.yaml --force

decrypt:
	ansible-vault decrypt vars/*.yaml

encrypt:
	ansible-vault encrypt vars/*.yaml

gitinit:
	@./git-init.sh
	@echo "ansible vault pre-commit hook installed"
	@echo "don't forget to create a .vault-password too"