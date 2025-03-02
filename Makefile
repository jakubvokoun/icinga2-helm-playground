.PHONY: add-repo
add-repo:
	helm repo add icinga https://icinga.github.io/helm-charts
	helm repo update

.PHONY: template
template:
	helm template \
		-f values.yml \
		icinga/icinga-stack > generated/all.yml

.PHONY: up
up:
	minikube start
	kubectl apply -f generated/all.yml

.PHONY: down
down:
	minikube stop

.PHONY: clean
clean:
	minikube delete