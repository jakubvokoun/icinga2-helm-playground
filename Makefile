.PHONY: add-repo
add-repo:
	helm repo add icinga https://icinga.github.io/helm-charts
	helm repo update

.PHONY: template
template:
	helm template \
		-f values.yml \
		--release-name "icinga2-stack" \
		icinga/icinga-stack > generated/all.yml

.PHONY: up
up:
	minikube start
	kubectl apply -f generated/all.yml
	kubectl apply -f apps.yml

.PHONY: apply
apply:
	kubectl apply -f generated/all.yml
	kubectl apply -f apps.yml

.PHONY: down
down:
	minikube stop

.PHONY: clean
clean:
	minikube delete