#!/bin/sh

absdirpath() {
    echo $(cd "$1"; pwd -P)
}

# Same semantics as in build-sample-app.sh
# BUILD_DIR can be a relative or absolute path
# if relative, then make it relative to sdk-build
# if not specified, defaults to "sdk-build/avs-device-sdk" if not specified
BUILD_DIR="${1:-sdk-build/avs-device-sdk}"
if [[ "${BUILD_DIR}" != /* ]] && [[ "${BUILD_DIR}" != sdk-build/* ]]; then
    # make it relative to sdk-build
    BUILD_DIR="sdk-build/${BUILD_DIR}"
fi
echo "Running from ${BUILD_DIR}"

TOP_DIR="$(absdirpath "$(dirname "$PWD/$0")")"
BUILD_DIR="$(absdirpath "${BUILD_DIR}")"

APP_DIR="${BUILD_DIR}/SampleApp/src"
APP_CFGFILE="${BUILD_DIR}/Integration/AlexaClientSDKConfig.json"
KWD_MODEL_DIR="${TOP_DIR}/application-necessities/snowboy-kwd"

echo cd ${APP_DIR} \&\& ./SampleApp "${APP_CFGFILE}" "${KWD_MODEL_DIR}"
cd "${APP_DIR}" && ./SampleApp "${APP_CFGFILE}" "${KWD_MODEL_DIR}"
