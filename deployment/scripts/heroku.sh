# Install Heroku CLI
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

# login to Heroku repository
echo "$HEROKU_API_KEY" | docker login --username=_ --password-stdin registry.heroku.com

# Release new image
heroku login
heroku container:release web -a node-test-app-cj
