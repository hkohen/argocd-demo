# ------------------------------------------------------------------------------------------------------------------- 
# Gitlab Token generator for Secrets in Kubernetes 
#
# GITLAB_DEPLOY_TOKEN = the token provide by Gitlab web. When you run your script, it is necesary as an argument.
# USER_GITLAB_DEPLOY_TOKEN_USER = Username or servicename user with the privileges to access to Gitlab registry.
# 
# ./secret-gitlab-generator.sh GITLAB_DEPLOY_TOKEN
#
# -------------------------------------------------------------------------------------------------------------------

#!/bin/bash

if [ "$#" -ne 1 ]; then
    printf "Invalid arguments, please after script write the gitlab token. \n" >&2
    printf "Looks the following example Buddy ;) \n" >&2
    printf "./secret-gitlab-generator.sh <GITLAB_DEPLOY_TOKEN> \n" >&2
    exit 1;
fi

# Variable to obtain the .dockerconfigjson

secret_gen_string='{"auths":{"registry.gitlab.com":{"username":"{{USER}}","password":"{{TOKEN}}","auth":"{{SECRET}}"}}}'

gitlab_user=<USER_GITLAB_DEPLOY_TOKEN_USER> # Change the parameter USER_GITLAB_DEPLOY_TOKEN_USER for your Gitlabuser or Gitlab Service Account. 
gitlab_token=$1
gitlab_secret=$(echo -n "$gitlab_user:$gitlab_token" | base64 )

# Generator of the Gitlab Token for the secret file.
# 
printf " \n" >&2
printf "............................................................................................. \n" >&2
printf " \n" >&2
printf " Please, put the token in your secret-file.YAML and complete the field : .dockerconfigjson: \n" >&2
printf " \n" >&2
printf "............................................................................................. \n" >&2
printf " \n" >&2
echo -n $secret_gen_string | sed "s/{{USER}}/$gitlab_user/" | sed "s/{{TOKEN}}/$gitlab_token/" | sed "s/{{SECRET}}/$gitlab_secret/" | base64
