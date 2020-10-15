# im_stepper

![Pub Version (including pre-releases)](https://img.shields.io/pub/v/im_stepper?include_prereleases)
![GitHub issues](https://img.shields.io/github/issues-raw/imujtaba8488/package_im_stepper)
![GitHub closed issues](https://img.shields.io/github/issues-closed/imujtaba8488/package_im_stepper)
![GitHub last commit](https://img.shields.io/github/last-commit/imujtaba8488/package_im_stepper)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/imujtaba8488/package_im_stepper)

## Publications

You can find more articles, examples, posts, below:

* Medium Article with IconStepper Example: [Beautiful Page Indicators and Steppers with the im_stepper package](https://imujtaba8488.medium.com/beautiful-page-indicators-and-steppers-with-the-im-stepper-package-8c091cf5364e)

## Recent Changes

* BugFix - ticker disposed with active ticker. [More Info](https://pub.dev/packages/im_stepper/changelog)

## About

A growing collection of widgets primarily used to step-through various
steps/widgets or used as page indicators in an application.

## Description

A number of applications require to show steps to its users, for example, an app
surveying its users require to display the step that the user is on while the
user is filling up the survey form. This is where im_stepper comes into play
with easy to use stepper widgets that may find its uses in myriad applications.

Simply import `package:im_stepper/stepper.dart` and choose any of the following
steppers appropriate for your application:-

## Table of Contents

* [IconStepper](#iconstepper)

* [ImageStepper](#imagestepper)

* [DotStepper](#dotstepper)

* [NumberStepper](#numberstepper)

* [Feedback](#feedback)

* [Please Support](#please-support)

## IconStepper

A simple to use icon stepper widget, wherein, each icon defines a step. Hence,
total number of icons define total number of steps. Primarily designed to show
steps as icons.

![IconStepper](https://github.com/imujtaba8488/showcase/blob/master/icon_stepper_05.gif)

### IconStepper - Usage Note

* __Important:__ IconStepper `direction` argument controls whether the stepper is displayed
horizontally or vertically. A horizontal IconStepper can be wrapped within a Column
with no issues, however, if wrapped within a row it _must also be_ wrapped within
the built-in _Expanded_ widget. Same applies for the vertical IconStepper.

* IconStepper fires the `onStepReached(int index)` callback, which provides
the index of the Step that is reached. This callback can be used to control the
widget that appears when a certain step is reached.

* To customize the color, border, etc. of an IconStepper, simply wrap it inside
a Container and specify the `decoration` argument.

* To enable validation before the next step is reached, set the `steppingEnabled`
property to an appropriate value in a `StatefulWidget`.

* Github issues [#3](https://github.com/imujtaba8488/package_im_stepper/issues/3) and [#4](https://github.com/imujtaba8488/package_im_stepper/issues/3) stand resolved. To control the IconStepper, ImageStepper, or the NumberStepper by using buttons etc from outside the stepper, use the `Foo.externallyControlled()` constructor and call `goNext` and `goPrevious` controlled by two variables in a `StatefulWidget` within a `setState` call. For further information see example [here](https://pub.dev/packages/im_stepper/example)

## ImageStepper

A simple to use image stepper widget, wherein, each image defines a step. Hence,
total number of images define total number of steps. Primarily designed to show
steps as images.

![ImageStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/image_stepper_02.gif)

### ImageStepper - Usage Note

* [Usage Note](#iconstepper---usage-note) - See IconStepper Usage Note.

## DotStepper

A simple and smooth dot stepper widget with built-in animations. Each dot in a
DotStepper represents a step.

## Available Shapes

 **Shapes**        | **Demo**
-------------------|------------
 Circle            |![Circle](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_circle.png)
 Square            |![Square](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_square.png)
 Rounded Rectangle |![RR](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_rounded_rectangle.png)
 Line              |![Line](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_line.png)

## Available Effects

 **Effect** | **Demo**
------------|----------------
 Trail      |![Trail](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_trail.gif)
 Slide      |![Slide](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_slide.gif)
 Magnify    |![Magnify](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_magnify.gif)
 Worm       |![Worm](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_worm.gif)
 Flat       |![Flat](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_flat.gif)
 Bullet     |![Bullet](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_bullet.gif)
 Jump       |![Jump](https://github.com/imujtaba8488/showcase/blob/master/dot_stepper_jump.gif)

### DotStepper - Usage Note

* __Important:__ It is important that a call to `goNext` and `goPrevious` is
controlled by two variables in a `StatefulWidget` with a call to `setState` in
order for the DotStepper to work. __Please look at the Example.__

## NumberStepper

A simple to use number stepper widget, wherein, each number defines a step. Hence,
total count of numbers define total number of steps. Primarily designed to show
steps as numbers.

![ImageStepper](https://github.com/imujtaba8488/showcase/blob/master/im_stepper/number_stepper_01.gif)

### NumberStepper - Usage Note

* [Usage Note](#iconstepper---usage-note) - See IconStepper Usage Note.

## Feedback

For any feedback please file an issue
__[here](https://github.com/imujtaba8488/package_im_stepper/issues).__

![Like](https://github.com/imujtaba8488/showcase/blob/master/thumbs_up.png) Please __Like__ to __support__!

## Please Support

* [Become a Patron](https://www.patreon.com/imujtaba8488)

* [Buy me a Coffee](https://www.buymeacoffee.com/imujtaba8488)
