.DEFAULT_GOAL := create

create: 
	@kind create cluster --config config.yml

destroy: 
	@kind delete clusters kind