
# # Step 1: Run setup.sh
# ./setup.sh

# Step 2: Setup environment variables

# set docker variables
docker_compose_command="docker-compose run frontend getent hosts host.docker.internal | awk '{ print \$1 }'"
DOCKER_HOST_IP=$(eval $docker_compose_command)
DOCKER_ENV_EXAMPLE='0.0.0.1'

# Print the DOCKER_HOST_IP
echo "$DOCKER_HOST_IP"

# Create an env file
echo 'Creating an env file...'
echo "some_token $DOCKER_HOST_IP" > .aaaaa


# Check if .env.example exists and if the value of DOCKER_HOST_IP matches $DOCKER_ENV_EXAMPLE
if [ -f .env.example ]; then
  if [ "$DOCKER_HOST_IP" != "$DOCKER_ENV_EXAMPLE" ]; then
    echo "Updating DOCKER_HOST_IP value..."
    sed -i "s/DOCKER_HOST_IP=.*/DOCKER_HOST_IP=$DOCKER_ENV_EXAMPLE/g" .test
  fi
else
  # Create a new .env file with default values
  echo "Creating a new .env file..."
  echo "DOCKER_HOST_IP=$DOCKER_HOST_IP" > .test + 
fi


# # Step 4: Start stack with docker-compose
# docker-compose build
# docker-compose up -d

# # Wait for a bit (assuming some processes might take a few seconds to start)
# sleep 10

# # Step 5: Create a new tenant for the backend
# echo -e "test1\ntest1\nTrue\ntest1.pleio.local\nTrue\n" | docker-compose exec -T backend python manage.py create_tenant

# # Step 6: Elasticsearch setup
# docker-compose run background celery -A backend2.celery call core.tasks.elasticsearch_tasks.elasticsearch_recreate_indices
# docker-compose run background celery -A backend2.celery call core.tasks.elasticsearch_tasks.elasticsearch_rebuild_all

# # Step 7: Create a public tenant
# echo -e "public\npublic\nTrue\nlocalhost\nTrue\n" | docker-compose exec -T backend python manage.py create_tenant

# # Step 8: Create a superuser
# echo -e "admin\nadmin@admin.com\npassword\npassword\n" | docker-compose exec -T backend python manage.py createsuperuser

# # Reminder for user to access the control
# echo "Now you can access the control at: http://localhost:8888"

# # End message
# echo "Setup completed. Check the given instructions for any additional steps and configurations."
