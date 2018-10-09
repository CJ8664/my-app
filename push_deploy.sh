# install AWS SDK
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin

# install necessary dependency for ecs-deploy
add-apt-repository ppa:eugenesan/ppa
apt-get update
apt-get install jq -y

# install ecs-deploy
curl https://raw.githubusercontent.com/silinternational/ecs-deploy/master/ecs-deploy | \
 sudo tee -a /usr/bin/ecs-deploy
sudo chmod +x /usr/bin/ecs-deploy

# or login DockerHub
echo "$REGISTRY_PASS" | docker login --username "$REGISTRY_USER" --password-stdin

# login AWS ECR
echo $(aws ecr get-login --no-include-email --region us-east-2)

# build the docker image and push to an image repository
docker build -t node-test-app .
docker tag node-test-app:latest 812939987703.dkr.ecr.us-east-2.amazonaws.com/node-test-app:latest
docker push 812939987703.dkr.ecr.us-east-2.amazonaws.com/node-test-app:latest

# build the docker image and push to an image repository
# docker build --tag erchiragjain92/node-test-app .
# docker tag "$IMAGE_NAME" "${IMAGE_NAME}:latest"
# docker push "${IMAGE_NAME}:latest"

# update an AWS ECS service with the new image
# ecs-deploy -c $CLUSTER_NAME -n $SERVICE_NAME -i $IMAGE_REPO_URL:latest
