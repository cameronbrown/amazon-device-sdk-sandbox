#!/bin/sh

absdirpath() {
    echo $(cd "$1"; pwd -P)
}

TOP_DIR="$(absdirpath "$(dirname "$PWD/$0")")"
BUILD_DIR="${TOP_DIR}/${1:-sdk-build}"

APP_DIR="${BUILD_DIR}/SampleApp/src"
APP_CFGFILE="${BUILD_DIR}/Integration/AlexaClientSDKConfig.json"
KWD_MODEL_DIR="${TOP_DIR}/application-necessities/snowboy-kwd"

echo cd ${APP_DIR} \&\& ./SampleApp "${APP_CFGFILE}" "${KWD_MODEL_DIR}"
cd "${APP_DIR}" && ./SampleApp "${APP_CFGFILE}" "${KWD_MODEL_DIR}"
