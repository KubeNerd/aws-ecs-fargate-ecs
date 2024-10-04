APP=aws-ecs-fargate-ecs
CLUSTER=cluster-dev
NAMESPACE=aws-ecs-fargate-ecs

build-dev:
	@docker build -t $(APP):dev . --build

compose:
	@docker compose up -d