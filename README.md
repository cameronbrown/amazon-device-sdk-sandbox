# Amazon Device SDK Sandbox

## Assumptions

These instructions and scripts are for Mac OS X. They likely won't work exactly right elsewhere, but may be close.

## Building a wake-word enabled AVS Application

### Install dependencies

* First, some system packages (this assumes you already have [brew](https://brew.sh/))

    `brew install curl --with-nghttp2`

    `brew install gstreamer gst-plugins-base gst-plugins-good
     gst-plugins-bad gst-libav`

    `brew install sqlite3 repo cmake clang-format doxygen wget git`

    `brew install portaudio sox`

* Now, some python packages (this assumes you
   already have [pip](https://en.wikipedia.org/wiki/Pip_(package_manager)))

    `pip install flask requests commentjson pyaudio`

### Download the software

* Run the initial-setup script to download the
  [Amazon Device SDK](https://github.com/alexa/avs-device-sdk) and
  [KITT.AI snowboy](https://github.com/kitt-ai/snowboy) git repos
  and mix them together properly

    `./initial-setup.sh`

### Create an app security profile

* Create (or review) a security profile for this app at developer.amazon.com

   For detailed instructions, check out <https://github.com/alexa/alexa-avs-sample-app/wiki/Create-Security-Profile>

* Edit `avs-security-profile`, adding the productId,
   clientId, and clientSecret from this app's security profile.

### Configure the build

`./config-sample-app.sh`

### Build

`./build-sample-app.sh`

### Try it out

`./run-sample-app.sh`

## Make your own custom wake-word
