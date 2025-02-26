# XCTest examples

> **For Demonstration Purposes Only**\
> The code in these scripts is provided on an "AS-IS" basis without warranty of any kind, either express or implied,
> including without limitation any implied warranties of condition, uninterrupted use, merchantability, fitness for a
> particular purpose, or non-infringement. These scripts are provided for educational and demonstration purposes only,
> and should not be used in production. Issues regarding these scripts should be submitted through GitHub. These scripts
> are maintained by the Technical Services team at Sauce Labs.

## Introduction

This repository contains multiple examples of how to run an XCTest on the Sauce Labs cloud. In addition to that, we provide the source code
of the demonstration app used in these examples. This will help illustrate how to leverage `xctestplan` and `xctestrun` configuration files
to successfully execute an XCTest—just as it can be done with the following xcodebuild command:

```shell
xcodebuild test-without-building -xctestrun PATH_TO_XCTESTRUN_FILE
``` 

More information on how to use it can be found below.

## Prerequisites

- Please check our [documentation](https://docs.saucelabs.com/testrunner-toolkit/installation) for installing SauceCTL
  ***Note: minimum version is 0.192.0.***
- Make sure you've set up your credentials on your local machine and or CI pipeline, see
  [this](https://docs.saucelabs.com/testrunner-toolkit/installation#associating-your-sauce-labs-account)-doc
- Check the [XCTest](https://docs.saucelabs.com/mobile-apps/automated-testing/espresso-xcuitest/xctest/)-docs for all options

### Install `saucectl`

```shell
curl -L https://saucelabs.github.io/saucectl/install | bash
```

> ⚠️ Make sure saucectl version is newer than **0.192.0**

## Apps

This repository includes prebuilt native iOS applications along with their XCUITest test cases. The source code for the demo app can be
found under [app_source/FakeCounterApp](/app_source/FakeCounterApp).

### App Structure

The app consists of five targets:

* Two application targets
* Three UI test targets, one of which interacts with a system app (Calculator)

* All test executions are managed through the `xctestplan` file. This file allows selecting which tests should be included in the
  generated `xctestrun` configuration file.

### Building the Apps & Generating the `xctestrun` File

You can build the apps and generate the `xctestrun` file in two ways:

1. Directly via xcodebuild

Navigate to the [app_source/FakeCounterApp](/app_source/FakeCounterApp) folder
and run the xcodebuild command to generate the required build artifacts.

1. Using the Makefile (Recommended)

* From the project root, you can simply run the `make` command.

```shell
make
```

* This script will:
    * Build all five .ipa application files
    * Generate a single xctestrun file
    * Place the built `.ipa` files and `xctestrun` file inside the `app_binaries folder
* These artifacts are then ready to be used with the existing `saucectl` configuration.

## Examples

All the below-mentioned examples can be found in the [`.sauce`](/.sauce)-folder. You can run the configurations by running the following
command from the root of this folder

      saucectl run --config ./.sauce/xctest_{#}.yaml

The `#` stands for the number of the below-mentioned examples.

### Real Devices

#### Example 1 - Simple XCTest - Single test App is configured

[`xctest_1.yaml`](/.sauce/xctest_1.yaml) provides a minimum configuration needed to run the XCTest tests.
In this example, all test cases are configured in a single application are executed on a single, available device.

#### Example 2 - Mix XCTest and XCUITEST - Multiple test Apps are configured

[`xctest_2.yaml`](/.sauce/xctest_2.yaml) provides a extended configuration needed to run the XCTest tests.
In this example, all test cases (XCTests or XCUITEST) are configured in a multiple applications or Test UI applications are executed on a
single, available device.

#### Example 3 - Mix XCTest and XCUITEST- One XCUITest With system app - Multiple test Apps are configured

[`xctest_3.yaml`](/.sauce/xctest_3.yaml) provides a extended configuration needed to run the XCTest tests.
In this example, all test cases (XCTests or XCUITEST) are configured in a multiple applications or Test UI applications that needs an
application or a system application are executed on a single, available device.