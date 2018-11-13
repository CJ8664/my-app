# login DockerHub
printf "Building docker image for ${DEPLOY_ENV}\n\n"

echo "$REGISTRY_PASS" | docker login --username "$REGISTRY_USER" --password-stdin

# build the docker image and push to DockerHub repository
docker build --tag erchiragjain92/node-test-app .
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:${DEPLOY_ENV}"
docker push "${IMAGE_NAME}:${DEPLOY_ENV}"
