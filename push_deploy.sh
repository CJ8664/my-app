# Install Heroku CLI
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

# login DockerHub
echo "$REGISTRY_PASS" | docker login --username "$REGISTRY_USER" --password-stdin

# build the docker image and push to DockerHub repository
docker build --tag erchiragjain92/node-test-app .
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:latest"
docker push "${IMAGE_NAME}:latest"

# login to Heroku repository
echo "$HEROKU_API_KEY" | docker login --username=_ --password-stdin registry.heroku.com

# Push to Heroku repository
docker tag erchiragjain92/node-test-app registry.heroku.com/node-test-app-cj/web
docker push registry.heroku.com/node-test-app-cj/web

# Release new image
heroku login
heroku container:release web
