#!/bin/sh

# Web icons are overwritten on deployment with Github Actions.
#
# run: FLAVOR=dev ./deploy.sh
# run: FLAVOR=stg ./deploy.sh
# run: FLAVOR=prod ./deploy.sh

# overwrite web icons.
if [ $FLAVOR = 'dev' ]; then
    \cp -f ./web/dev/favicon.png ./web/favicon.png
    \cp -rf ./web/dev/icons/ ./web/icons/
    echo replaced by dev
elif [ $FLAVOR = 'stg' ]; then
    \cp -f ./web/stg/favicon.png ./web/favicon.png
    \cp -rf ./web/stg/icons/ ./web/icons/
    echo replaced by stg
elif [ $FLAVOR = 'prod' ]; then
    \cp -f ./web/prod/favicon.png ./web/favicon.png
    \cp -rf ./web/prod/icons/ ./web/icons/
    echo replaced by prod
else
    # echo It was not replaced by anything.
    \cp -f ./web/prod/favicon.png ./web/favicon.png
    \cp -rf ./web/prod/icons/ ./web/icons/
    echo replaced by prod
fi
