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

* __IMPORTANT MESSAGE:__ `goNext`, `goPrevious`, and `Foo.externallyControlled` properties and constructors have been deprecated and will be removed from Icon, Image, Number, and Dot Steppers in version __0.1.3__. The `dotReachedIndex` property in `DotStepper` has been deprecated and will be also removed in version __0.1.3__. Please consider updating your code! see examples __[here](https://pub.dev/packages/im_stepper/example)__.

[![](https://api.gh-polls.com/poll/01ER2HSQMW9DJQ30KKMTGRA6NW/Flutter)](https://api.gh-polls.com/poll/01ER2HSQMW9DJQ30KKMTGRA6NW/Flutter/vote)
[![](https://api.gh-polls.com/poll/01ER2HSQMW9DJQ30KKMTGRA6NW/Dart)](https://api.gh-polls.com/poll/01ER2HSQMW9DJQ30KKMTGRA6NW/Dart/vote)
[![](https://api.gh-polls.com/poll/01ER2HSQMW9DJQ30KKMTGRA6NW/Java)](https://api.gh-polls.com/poll/01ER2HSQMW9DJQ30KKMTGRA6NW/Java/vote)

* Introducing the `activeStep` property, a __simpler__ way to control the steppers either from built-in buttons, by tapping, or from external buttons.

## About

A growing collection of stepper and page indicator widgets.

## Description

The stepper widgets help you to show or collect information from users using organized steps. On the other hand, the page indicator widgets allow you to visually notify users about their current position as they scroll through a group of pages.

## Table of Contents

* [General Guidelines](#general-guidelines)

* [IconStepper](#iconstepper)

* [ImageStepper](#imagestepper)

* [DotStepper](#dotstepper)

* [NumberStepper](#numberstepper)

* [Feedback](#feedback)

* [Please Support](#please-support)

* [Follow Me](#follow-me)

## General Guidelines

* Simply import `package:im_stepper/stepper.dart`.

* __Important:__ The `direction` argument controls whether the stepper is displayed horizontally or vertically. A horizontal IconStepper can be wrapped within a Column with no issues. However, if wrapped within a row, it _must also be_ wrapped within the built-in _Expanded_ widget. The same applies to the vertical IconStepper.

* __Validation:__ To enable validation before the next step is reached, set the `steppingEnabled` property to an appropriate value in a `StatefulWidget`.

* __Controlling Steppers:__ todo: provide description of activeStep, minSteps and maxSteps.

* To customize the color, border, etc., wrap a stepper widget inside a `Container` and specify it's `decoration` argument.

## IconStepper

Simple to use icon stepper widget, wherein each icon defines a step. Hence, the total number of icons represents the total number of available steps.

![IconStepper](https://github.com/imujtaba8488/showcase/blob/master/icon_stepper_05.gif)

## ImageStepper

Simple to use image stepper widget, wherein each image defines a step. Hence, the total number of images defines the total number of steps. [Usage Note](#iconstepper---usage-note) - See IconStepper Usage Note.

![ImageStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/image_stepper_02.gif)

## NumberStepper

A simple to use number stepper widget, wherein each number defines a step. Hence, the total count of numbers defines the total number of steps. [Usage Note](#iconstepper---usage-note) - See IconStepper Usage Note.

![ImageStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/number_stepper_01.gif)

## DotStepper

A family of fully customizable, beautiful page indicator widgets with awesome built-in animations. Each dot in a DotStepper represents a step. [Usage Note](#general-guidelines) - See General Guidelines and examples.

## Shapes

 **Shapes**        | **Demo**
-------------------|------------
 Circle            |![Circle](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_circle.png)
 Square            |![Square](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_square.png)
 Rounded Rectangle |![RR](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_rounded_rectangle.png)
 Line              |![Line](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_line.png)

## Effects

 **Effect** | **Demo**
------------|----------------
 Trail      |![Trail](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_trail.gif)
 Slide      |![Slide](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_slide.gif)
 Magnify    |![Magnify](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_magnify.gif)
 Worm       |![Worm](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_worm.gif)
 Flat       |![Flat](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_flat.gif)
 Bullet     |![Bullet](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_bullet.gif)
 Jump       |![Jump](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_jump.gif)

## Feedback

* Please file an issue __[here](https://github.com/imujtaba8488/package_im_stepper/issues).__

* For an enhancement request, please submit your idea __[here](https://forms.gle/e3PcHgeTgfx3sb1W9)__.

* For more information please send me email or follow me below.

## Please Support

* ![Like](https://github.com/imujtaba8488/showcase/blob/master/thumbs_up.png) Please __Like__ to __support__!

* [Become a Patron](https://www.patreon.com/imujtaba8488)

* [Buy me a Coffee](https://www.buymeacoffee.com/imujtaba8488)

## Follow me

* [](https://icons8.com/icon/114433/medium-monogram)[GitHub](https://github.com/imujtaba8488)

* [LinkedIn](https://www.linkedin.com/in/imujtaba8488/)

* [Medium](https://imujtaba8488.medium.com)

* [Twitter](https://twitter.com/imujtaba8488)

* [Instagram](https://www.instagram.com/imujtaba8488/)

* [Facebook](https://www.facebook.com/imujtaba8488/)
