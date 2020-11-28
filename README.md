# im_stepper

![Pub Version (including pre-releases)](https://img.shields.io/pub/v/im_stepper?include_prereleases)
![GitHub issues](https://img.shields.io/github/issues-raw/imujtaba8488/package_im_stepper)
![GitHub closed issues](https://img.shields.io/github/issues-closed/imujtaba8488/package_im_stepper)
![GitHub last commit](https://img.shields.io/github/last-commit/imujtaba8488/package_im_stepper)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/imujtaba8488/package_im_stepper)

## Publications

Here's a collection of articles, examples, posts, etc., about im_stepper. If you find another one please let me know.

* Medium Article with `IconStepper` Example: [Beautiful Page Indicators and Steppers with the im_stepper package](https://imujtaba8488.medium.com/beautiful-page-indicators-and-steppers-with-the-im-stepper-package-8c091cf5364e).

* Interested in reading a book or watching a video on effectively using the im_stepper package in your Flutter Apps? __[Vote here!](https://forms.gle/rQqpARMTAcCCNE9V8)__

## Recent Changes

Here's a list of some important changes in version: 0.1.2+7. For a complete list of changes see changelog [here](https://pub.dev/packages/im_stepper/changelog).

* __IMPORTANT MESSAGE:__ `goNext`, `goPrevious`, and `Foo.externallyControlled` properties and constructors have been deprecated and will be removed from Icon, Image, Number, and Dot Steppers in version __0.1.3__. The `dotReachedIndex` property in `DotStepper` has also been deprecated and will be removed in version __0.1.3__. Please consider updating your code! see examples __[here](https://pub.dev/packages/im_stepper/example)__.

* Introducing the `activeStep` property, a __simpler__ way to control the steppers either from built-in buttons, by tapping, or from external buttons with the ability to set initial step or jump to any step.

* __Message for the existing users:__ Do you prefer the new method or the older way to control the steppers? Please vote __[here](https://forms.gle/zsr7NBviR6bqaGRi6)!__ This message will be removed in version 0.1.3.

## About

A growing collection of stepper and page indicator widgets.

## Description

The stepper widgets help you to show or collect information from users using organized steps. The page indicator widgets allow you to visually notify users about their current position as they scroll through a group of pages.

## Table of Contents

* [General Guidelines](#general-guidelines)

* [IconStepper](#iconstepper)

* [ImageStepper](#imagestepper)

* [DotStepper](#dotstepper)

* [NumberStepper](#numberstepper)

* [Feedback](#feedback)

* [Follow Me](#follow-me)

* [Please Support](#please-support)

## General Guidelines

* Simply import `package:im_stepper/stepper.dart`.

* __Important:__ The `direction` argument controls whether the stepper is displayed horizontally or vertically. A horizontal IconStepper can be wrapped within a Column with no issues. However, if wrapped within a row, it _must also be_ wrapped within the built-in _Expanded_ widget. The same applies to the vertical IconStepper.

* __Validation:__ To enable validation before the next step is reached, set the `steppingEnabled` property to an appropriate value in a `StatefulWidget`.

* __Controlling Steppers:__ All steppers are controlled using the `activeStep` property. You can control a stepper by:-

  * using the built-in next and previous buttons.

  * tapping individual steps in case of Icon, Image, and Number steppers. Please note that the tapping behavior doesn't apply to the `DotStepper`.

  * using external buttons or events.

    * See examples __[here](https://pub.dev/packages/im_stepper/example)__.

* To customize the color, border, etc., wrap a stepper widget inside a `Container` and specify it's `decoration` argument.

## IconStepper

Simple to use icon stepper widget, wherein each icon defines a step. Hence, the total number of icons represents the total number of available steps. [See Example](https://pub.dev/packages/im_stepper/example).

![IconStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/landing/icon_stepper.gif)

## ImageStepper

Simple to use image stepper widget, wherein each image defines a step. Hence, the total number of images defines the total number of steps. [See Example](https://pub.dev/packages/im_stepper/example).

![ImageStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/landing/image_stepper.gif)

## NumberStepper

A simple to use number stepper widget, wherein each number defines a step. Hence, the total count of numbers defines the total number of steps. [See Example](https://pub.dev/packages/im_stepper/example).

![ImageStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/landing/number_stepper.gif)

## DotStepper

A family of fully customizable, beautiful page indicator widgets with awesome built-in animations. Each dot in a DotStepper represents a step. [See Example](https://pub.dev/packages/im_stepper/example).

> Important Note: __`activeStep` must start from 1 and not from 0.__

## Shapes

 **Shapes**        | **Demo**
-------------------|------------
 Circle            |![Circle](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/circle.png)
 Square            |![Square](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/square.png)
 Rounded Rectangle |![RR](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/rounded_rectangle.png)
 Dash              |![Dash](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/dash.png)

## Effects

 **Effect**      | **Demo**
-----------------|----------------
 Trail           |![Trail](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/trail.gif)
 Slide           |![Slide](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/slide.gif)
 Magnify         |![Magnify](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/magnify.gif)
 Worm            |![Worm](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/worm.gif)
 Flat            |![Flat](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/flat.gif)
 Bullet          |![Bullet](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/bullet.gif)
 Jump            |![Jump](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/jump.gif)
 Jump From Above |![jfa](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/jump_from_above.gif)
 Jump From Below |![jfb](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/jump_from_below.gif)

## Feedback

* Please file an issue __[here](https://github.com/imujtaba8488/package_im_stepper/issues).__

* For more information please send me an email or follow me below.

## Follow me

[![GitHub](https://github.com/imujtaba8488/showcase/blob/master/icons/github_64px%20b:w.png)](https://github.com/imujtaba8488) [![Twitter](https://github.com/imujtaba8488/showcase/blob/master/icons/twitter_64px%20b:w.png)](https://twitter.com/imujtaba8488)  [![LinkedIn](https://github.com/imujtaba8488/showcase/blob/master/icons/linkedin_64px%20b:w.png)](https://www.linkedin.com/in/imujtaba8488/)  [![Medium](https://github.com/imujtaba8488/showcase/blob/master/icons/medium_64px%20b:w.png)](https://imujtaba8488.medium.com)  [![Instagram](https://github.com/imujtaba8488/showcase/blob/master/icons/insta_64px%20b:w.png)](https://www.instagram.com/imujtaba8488/)  [![Facebook](https://github.com/imujtaba8488/showcase/blob/master/icons/fb_64px%20b:w.png)](https://www.facebook.com/imujtaba8488/)

## Please Support

* ![Like](https://github.com/imujtaba8488/showcase/blob/master/icons/thumbs_up.png) Please __Like__ to __support__!

* [Become a Patron](https://www.patreon.com/imujtaba8488)

* [Buy me a Coffee](https://www.buymeacoffee.com/imujtaba8488)
