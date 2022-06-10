# im_stepper

![Pub Version (including pre-releases)](https://img.shields.io/pub/v/im_stepper?include_prereleases)
![GitHub issues](https://img.shields.io/github/issues-raw/imujtaba8488/package_im_stepper)
![GitHub closed issues](https://img.shields.io/github/issues-closed/imujtaba8488/package_im_stepper)
![GitHub last commit](https://img.shields.io/github/last-commit/imujtaba8488/package_im_stepper)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/imujtaba8488/package_im_stepper)

## Recent Changes

Here's a list of some important changes in version: __1.0.0__. For a complete list of changes see changelog [here](https://pub.dev/packages/im_stepper/changelog).

* Update to Flutter 3.0
* Fix android 2 embedding issue
* Fix lint warnings -- Thank you [TheMeanCanEHdian](https://github.com/TheMeanCanEHdian) 
* Add line padding -- Thank you [Mateusz](https://github.com/matheowis)
* Update README -- Thank you [TimothyNgoi](https://github.com/TimothyNgoi98)

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

* [Publications](#publications)

* [Feedback](#feedback)

* [Connect with me](#connect-with-me)

* [Please Support](#please-support)

## General Guidelines

* Simply import `package:im_stepper/stepper.dart`.

* __Important:__ The `direction` argument controls whether the stepper is displayed horizontally or vertically. A horizontal IconStepper can be wrapped within a Column with no issues. However, if wrapped within a row, it _must also be_ wrapped within the built-in _Expanded_ widget. The same applies to the vertical IconStepper.

* __Validation:__ To enable validation before the next step is reached, set the `steppingEnabled` property to an appropriate value in a `StatefulWidget`.

* __Controlling Steppers:__ All steppers are controlled using the `activeStep` property. You can control a stepper by:-

  * using the built-in next and previous buttons. __Note:__ DotStepper does not have built-in next and previous buttons.

  * tapping individual steps.

  * using external buttons or events.

    * See examples __[here](https://pub.dev/packages/im_stepper/example)__.

* To customize the color, border, etc., wrap a stepper widget inside a `Container` and specify it's `decoration` argument.

## IconStepper

Simple to use icon stepper widget, wherein each icon defines a step. Hence, the total number of icons represents the total number of available steps. [See Example](https://pub.dev/packages/im_stepper/example).

![IconStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/landing/icon_stepper.gif)

## ImageStepper

Simple to use image stepper widget, wherein each image defines a step. Hence, the total number of images represents the total number of steps. [See Example](https://pub.dev/packages/im_stepper/example).

![ImageStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/landing/image_stepper.gif)

## NumberStepper

A simple to use number stepper widget, wherein each number defines a step. Hence, the total count of numbers represents the total number of steps. [See Example](https://pub.dev/packages/im_stepper/example).

![ImageStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/landing/number_stepper.gif)

## DotStepper

A family of fully customizable, beautiful page indicator widgets with awesome built-in animations. Each dot in a DotStepper represents a step. Supports resizing the dots, managing spacing between dots, enabling lineConnectors, customizing with decorations, etc. [See Example](https://pub.dev/packages/im_stepper/example).

## Shapes

 **Shapes**        | **Demo**
-------------------|------------
 Circle            |![Circle](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/circle.png)
 Square            |![Square](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/square.png)
 Rectangle         |![Rect](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/rectangle.png)
 Squircle          |![Squircle](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/squircle.png)
 Stadium           |![Stadium](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/stadium.png)
 Pipe              |![Pipe](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/pipe.png)
 Pipe2             |![Pipe2](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/shapes/pipe2.png)

## Effects

 **Effect**      | **Demo**
-----------------|----------------
 Blink           |![Blink](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/blink.gif)
 Jump            |![Jump](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/jump.gif)
 Magnify         |![Magnify](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/magnify.gif)
 Shift           |![Shift](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/shift.gif)
 Shrink          |![Shrink](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/shrink.gif)
 Slide           |![Slide](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/slide.gif)
 Thump           |![Thump](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/thump.gif)
 Worm            |![Worm](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/dot_stepper/effects/worm.gif)

## Publications

Here's a collection of articles, examples, posts, etc., about im_stepper. If you find another one please let me know.

* Medium Article with `IconStepper` Example: [Beautiful Page Indicators and Steppers with the im_stepper package](https://imujtaba8488.medium.com/beautiful-page-indicators-and-steppers-with-the-im-stepper-package-8c091cf5364e). __Note:__ A new way of controlling the steppers has been introduced in version 0.1.2+8. The article will be updated shorty. For now, please see examples.

* Interested in reading a book or watching a video on effectively using the im_stepper package in your Flutter Apps? __[Vote here!](https://forms.gle/rQqpARMTAcCCNE9V8)__

## Feedback

* Please file an issue __[here](https://github.com/imujtaba8488/package_im_stepper/issues).__

* For more information please send me an email or connect with me.

## Connect with me

[![GitHub](https://github.com/imujtaba8488/showcase/blob/master/icons/github_64px%20b:w.png)](https://github.com/imujtaba8488) [![Twitter](https://github.com/imujtaba8488/showcase/blob/master/icons/twitter_64px%20b:w.png)](https://twitter.com/imujtaba8488)  [![LinkedIn](https://github.com/imujtaba8488/showcase/blob/master/icons/linkedin_64px%20b:w.png)](https://www.linkedin.com/in/imujtaba8488/)  [![Medium](https://github.com/imujtaba8488/showcase/blob/master/icons/medium_64px%20b:w.png)](https://imujtaba8488.medium.com)  [![Instagram](https://github.com/imujtaba8488/showcase/blob/master/icons/insta_64px%20b:w.png)](https://www.instagram.com/imujtaba8488/)  [![Facebook](https://github.com/imujtaba8488/showcase/blob/master/icons/fb_64px%20b:w.png)](https://www.facebook.com/imujtaba8488/)

## Please Support

* ![Like](https://github.com/imujtaba8488/showcase/blob/master/icons/thumbs_up.png) Please __Like__ to __support__!

* [Become a Patron](https://www.patreon.com/imujtaba8488)

* [Buy me a Coffee](https://www.buymeacoffee.com/imujtaba8488)
