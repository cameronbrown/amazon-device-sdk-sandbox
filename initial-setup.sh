#!/bin/sh

(cd sdk-source; git git@github.com:alexa/avs-device-sdk.git avs-device-sdk)
(cd third-party/kittai; git git@github.com:Kitt-AI/snowboy.git snowboy)

if [ ! -f avs-security-profile ];  then
cat >avs-security-profile <<EOF
# From developer.amazon.com
export SDK_CONFIG_PRODUCT_ID=""
export SDK_CONFIG_CLIENT_ID=""
export SDK_CONFIG_CLIENT_SECRET=""
EOF
fi

echo "
Please create a device security profile for this app at
developer.amazon.com now.

For details, see:
   https://github.com/alexa/alexa-avs-sample-app/wiki/Create-Security-Profile

IMPORTANT: When you have your details, add the productId, clientId,
and clientSecret for this app to the avs-security-profile file and
then run ./config-sample-app.sh
"
