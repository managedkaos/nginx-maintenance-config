up:
	vagrant up --provision && vagrant status

new:
	vagrant destroy --force; vagrant up && vagrant status

provision:
	vagrant provision

halt clean:
	vagrant halt

destroy reallyclean:
	vagrant destroy --force

.PHONY: up new provision halt clean destroy reallyclean
