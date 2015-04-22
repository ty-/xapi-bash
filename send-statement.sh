#!/bin/bash

ENDPOINT="https://lrs.adlnet.gov/xapi/statements"

# Have bash encode the credentials to base64
USER="xapi-tools"
PASS="xapi-tools"
AUTH=$(echo -n "$USER:$PASS" | base64)

# Already encoded AUTH 
#AUTH="eGFwaS10b29sczp4YXBpLXRvb2xz"


STMT='{
    "actor": {
        "mbox": "mailto:tyler.mulligan.ctr@adlnet.gov",
        "name": "Tyler",
        "objectType": "Agent"
    },
    "verb": {
        "id": "http://adlnet.gov/expapi/verbs/passed",
        "display": {
            "en-US": "passed"
        }
    },
    "object": {
        "id": "http://adlnet.gov/expapi/activities/example",
        "definition": {
            "name": {
                "en-US": "Example Activity"
            },
            "description": {
                "en-US": "Example activity description"
            }
        },
        "objectType": "Activity"
    }
}'

curl -i -X POST -H "X-Experience-API-Version: 1.0.1" -H "Authorization: Basic $AUTH" --data-binary "$STMT" $ENDPOINT
