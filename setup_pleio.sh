# # #  Step 0 Clone repo

# git clone git@gitlab.com:pleio/pleio-dev-stack.git pleio-dev-stack
# cd pleio-dev-stack

# # # Step 1: Run setup.sh

# # ./setup.sh

# # Step 2: Setup environment variables

# # set docker variables 

DOCKER_IP_COMMAND=$(docker-compose run frontend getent hosts host.docker.internal | awk '{ print $1 }') 
echo $DOCKER_IP_COMMAND


    # echo 'Creating an env file...'
# echo "some_token $DOCKER_HOST_IP" > .aaaaa


# Check if .env.example exists and if the value of DOCKER_HOST_IP matches $DOCKER_ENV_EXAMPLE
# echo 'Creating an env file...'
# echo "some_token $DOCKER_HOST_IP" > .aaaaa

DOCKER_ENV_VARIABEL="DOCKER_HOST_IP"
 

 echo $DOCKER_ENV_VARIABEL=$DOCKER_IP_COMMAND > .envtest
echo "#OIDC_RP_CLIENT_ID=" >> .envtest
echo "#OIDC_RP_CLIENT_SECRET=" >> .envtest
echo "#OIDC_OP_AUTHORIZATION_ENDPOINT=http://account.pleio.local:8005/openid/authorize/" >> .envtest
echo "#OIDC_OP_TOKEN_ENDPOINT=http://account.pleio.local:8005/openid/token/" >> .envtest
echo "#OIDC_OP_USER_ENDPOINT=http://account.pleio.local:8005/openid/userinfo/" >> .envtest
echo "#OIDC_OP_LOGOUT_ENDPOINT=http://account.pleio.local:8005/openid/logout/" >> .envtest
echo "DEEPL_TOKEN=" >> .envtest
echo "FRONTEND_LIVE_RELOAD=1" >> .envtest

# if [ -f .env.example ]; then
#   echo "Creating .env file..."
#   cp .env.example .bbbbbb
#   sed -i "$DOCKER_ENV_VARIABEL + $DOCKER_IP_COMMAND/g" .bbbbbb
#   echo "Created .env file."
# fi

# # # Step 4: Start stack with docker-compose
# # docker-compose build
# # docker-compose up -d

# # # Wait for a bit (assuming some processes might take a few seconds to start)
# # sleep 10

# # # Step 5: Create a new tenant for the backend
# # echo -e "test1\ntest1\nTrue\ntest1.pleio.local\nTrue\n" | docker-compose exec -T backend python manage.py create_tenant

# # # Step 6: Elasticsearch setup
# # docker-compose run background celery -A backend2.celery call core.tasks.elasticsearch_tasks.elasticsearch_recreate_indices
# # docker-compose run background celery -A backend2.celery call core.tasks.elasticsearch_tasks.elasticsearch_rebuild_all

# # # Step 7: Create a public tenant
# # echo -e "public\npublic\nTrue\nlocalhost\nTrue\n" | docker-compose exec -T backend python manage.py create_tenant

# # # Step 8: Create a superuser
# # echo -e "admin\nadmin@admin.com\npassword\npassword\n" | docker-compose exec -T backend python manage.py createsuperuser

# # # Reminder for user to access the control
# # echo "Now you can access the control at: http://localhost:8888"

# # # End message
# # echo "Setup completed. Check the given instructions for any additional steps and configurations."

