# im_stepper

![Pub Version (including pre-releases)](https://img.shields.io/pub/v/im_stepper?include_prereleases)
![GitHub issues](https://img.shields.io/github/issues-raw/imujtaba8488/package_im_stepper)
![GitHub closed issues](https://img.shields.io/github/issues-closed/imujtaba8488/package_im_stepper)
![GitHub last commit](https://img.shields.io/github/last-commit/imujtaba8488/package_im_stepper)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/imujtaba8488/package_im_stepper)

## About

A growing collection of widgets primarily used to step-through various
steps/widgets in an application.

## Description

A number of applications require to show steps to its users, for example, an app
surveying its users require to display the step that the user is on while the
user is filling up the survey form. This is where im_stepper comes into play
with easy to use stepper widgets that may find its uses in myriad applications.

Simply import `package:im_stepper/stepper.dart` and choose any of the following
steppers appropriate for your application:

## IconStepper

A simple to use icon stepper widget, wherein, each icon defines a step. Hence,
total number of icons define total number of steps. Primarily designed to show
steps as icons.

### IconSteeper - Usage Note

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

## DotStepper

A simple and smooth dot stepper widget with built-in animations. Each dot in a
DotStepper represents a step.

 **Effect** | **Screenshot**
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

## Feedback

For any feedback please file an issue
__[here](https://github.com/imujtaba8488/package_im_stepper/issues).__
Please __support__ by hitting __like__ button.

## Screenshots

![icon_stepper_01](https://github.com/imujtaba8488/showcase/blob/master/icon_stepper_01.gif)
![icon_stepper_02](https://github.com/imujtaba8488/showcase/blob/master/icon_stepper_02.gif)
![icon_stepper_03](https://github.com/imujtaba8488/showcase/blob/master/icon_stepper_03.gif)
