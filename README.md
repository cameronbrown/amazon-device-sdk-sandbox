# Amazon Device SDK Sandbox

In addition to the following instructions, it may also be useful
to read the Alexa Device SDK [MacOS Quick Start Guide](https://github.com/alexa/avs-device-sdk/wiki/macOS-Quick-Start-Guide)

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

* Once your security profile values are filled in, configure the sample app.  This will create the file `AlexaClientSDKConfig.json` which will be copied into the build directory during build.

    `./config-sample-app.sh`

* Review and edit the values in this file if desired.

### Build

* Build the sample app

    `./build-sample-app.sh`

* After building, this script will run a local web server to help acquire a current refresh token for the app. You must open a browser to <http://localhost:3000> and log in with your Amazon credentials to get the token. More Info [here](https://github.com/alexa/avs-device-sdk/wiki/macOS-Quick-Start-Guide#33-obtain-a-refresh-token).

### Try it out

* Run the sample app

    `./run-sample-app.sh`

## Make your own custom wake-word

* Go to <https://snowboy.kitt.ai>
* Create and download a .pmdl file
* Save it to application-necessities/snowboy-kwd/alexa.umdl
* It may necessary to adjust `KITT_AI_SENSITIVITY` in [SampleApp/src/SampleApplication.cpp:93](sdk-source/avs-device-sdk/SampleApp/src/SampleApplication.cpp)
