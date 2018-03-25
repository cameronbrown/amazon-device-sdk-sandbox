#!/bin/sh

absdirpath() {
    echo $(cd "$1"; pwd -P)
}

# BUILD_DIR can be a relative or absolute path
# if relative, then make it relative to sdk-build
# if not specified, defaults to "sdk-build/avs-device-sdk" if not specified
BUILD_DIR="${1:-sdk-build/avs-device-sdk}"
if [[ "${BUILD_DIR}" != /* ]] && [[ "${BUILD_DIR}" != sdk-build/* ]]; then
    # make it relative to sdk-build
    BUILD_DIR="sdk-build/${BUILD_DIR}"
fi
echo "Building in ${BUILD_DIR}"

SDK_SOURCE_DIR="$(absdirpath sdk-source/avs-device-sdk)"

BUILD_TYPE=DEBUG
#BUILD_TYPE=RELEASE
#BUILD_TYPE=MINSIZEREL

CURL_PREFIX_PATH=/usr/local/opt/curl

PORTAUDIO_LIB_PATH=/usr/local/lib/libportaudio.a
PORTAUDIO_INCLUDE_DIR=/usr/local/include

KITTAI_BASE_DIR="$(absdirpath third-party/kittai)"
KITTAI_KWD_INCLUDE_DIR="$KITTAI_BASE_DIR/snowboy/include"
KITTAI_KWD_LIB_PATH="$KITTAI_BASE_DIR/snowboy/lib/osx/libsnowboy-detect.a"

[ -d "${BUILD_DIR}" ] || mkdir -p "${BUILD_DIR}"

(cd "${BUILD_DIR}" && cmake "${SDK_SOURCE_DIR}" \
    -DCMAKE_BUILD_TYPE="${BUILD_TYPE}" \
    -DCMAKE_PREFIX_PATH="${CURL_PREFIX_PATH}" \
    -DKITTAI_KEY_WORD_DETECTOR=ON \
    -DKITTAI_KEY_WORD_DETECTOR_LIB_PATH="${KITTAI_KWD_LIB_PATH}" \
    -DKITTAI_KEY_WORD_DETECTOR_INCLUDE_DIR="${KITTAI_KWD_INCLUDE_DIR}" \
    -DGSTREAMER_MEDIA_PLAYER=ON \
    -DPORTAUDIO=ON \
    -DPORTAUDIO_LIB_PATH="${PORTAUDIO_LIB_PATH}" \
    -DPORTAUDIO_INCLUDE_DIR="${PORTAUDIO_INCLUDE_DIR}")

(cd "${BUILD_DIR}" && make SampleApp -j5)

cp -v ./AlexaClientSDKConfig.json \
    ${BUILD_DIR}/Integration/AlexaClientSDKConfig.json

(cd "${BUILD_DIR}" && python AuthServer/AuthServer.py)
