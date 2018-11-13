printf "********** Set the build type Prod/Beta *******************\n\n"
export DEPLOY_ENV="$1"

printf "********** Building Docker Image and pushing it ***********\n\n"
. docker.sh
printf "********** Done ***********\n\n"

printf "********** Pulling lastest image on dev server ************\n\n"
. ansible.sh
printf "********** Done ***********\n\n"
