#!/bin/bash

BOT_TOKEN="8476307424:AAEwM9nA3o0drjMhcF2_UBU_5xiqGQufaZM"
CHAT_ID="373999710"

check_status() {
  if [ "$1" = "success" ]; then
    echo "$2: SUCCESS"
  else
    echo "$2: FAILED"
  fi
}

BUILD_STATUS=${BUILD_STATUS:-failed}
STYLE_STATUS=${STYLE_STATUS:-failed}
TESTS_STATUS=${TESTS_STATUS:-failed}
DEPLOY_STATUS=${DEPLOY_STATUS:-failed}


MESSAGE="DO6 CI/CD Pipeline status

Project: $CI_PROJECT_NAME
Branch: $CI_COMMIT_REF_NAME

$(check_status "$BUILD_STATUS" "BUILD")
$(check_status "$STYLE_STATUS" "STYLE")
$(check_status "$TESTS_STATUS" "TESTS")
$(check_status "$DEPLOY_STATUS" "DEPLOY")

Pipeline: $CI_PIPELINE_URL
Job: $CI_JOB_URL
"

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d "chat_id=$CHAT_ID" \
  -d "text=$MESSAGE"