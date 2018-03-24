#!/bin/sh

set -e

ENVSUBST="/usr/local/Cellar/gettext/0.19.8.1/bin/envsubst"
APP_DB_DIR="application-necessities"
JSON_CONFIG_SOURCE="sdk-source/avs-device-sdk/Integration/AlexaClientSDKConfig.json"
JSON_CONFIG_DEST="./AlexaClientSDKConfig.json"

# Security profile info from developer.amazon.com
source ./avs-security-profile
if [ -z "${SDK_CONFIG_PRODUCT_ID}" ]; then
    echo Please add your security profile info to the avs-security-profile file
    exit 1
fi

# Make this up
export SDK_CONFIG_DEVICE_SERIAL_NUMBER="123456"

# Leave this blank
export SDK_CONFIG_REFRESH_TOKEN=

# Whatever you want
export SETTING_LOCALE_VALUE="en-US"

# These should be fine
APP_DB_DIR=$(cd ${APP_DB_DIR}; pwd -P) # Make sure it is an absolute path
export SDK_SQLITE_DATABASE_FILE_PATH="${APP_DB_DIR}/alerts.db"
export SDK_SQLITE_SETTINGS_DATABASE_FILE_PATH="${APP_DB_DIR}/settings.db"
export SDK_CERTIFIED_SENDER_DATABASE_FILE_PATH="${APP_DB_DIR}/certifiedSender.db"
export SDK_NOTIFICATIONS_DATABASE_FILE_PATH="${APP_DB_DIR}/notifications.db"

"${ENVSUBST}" <"${JSON_CONFIG_SOURCE}" >"${JSON_CONFIG_DEST}"
