# im_stepper

![Pub Version (including pre-releases)](https://img.shields.io/pub/v/im_stepper?include_prereleases)
![GitHub issues](https://img.shields.io/github/issues-raw/imujtaba8488/package_im_stepper)

## About

A growing collection of widgets primarily used to step-through various
steps/widgets in your application.

## Description

A number of applications require to show steps to its users, for example, an app
surveying its users require to display the step that the user is on while the user
is filling up the survey form. This is where im_stepper comes into play with easy
to use stepper widgets that may find its uses in a myriad applications.

<details>
<summary>
### IconStepper

A simple to use icon stepper widget, wherein, each icon defines a step. Hence,
total number of icons define total number of steps possible for the stepper.
Primarily designed to show steps as icons.

</summary>

* __Important:__ IconStepper `direction` argument controls whether the stepper is displayed
horizontally or vertically. A horizontal IconStepper can be wrapped within a Column
with no issues, however, if wrapped within a row it _must also be_ wrapped within
the built-in _Expanded_ widget. Same applies for the vertical IconStepper.

* __Note:__ IconStepper fires the `onStepReached(int index)` callback, which provides
the index of the Step that is reached. This callback can be used to control the
widget that appears when a certain step is reached.

![Screenshot](https://github.com/imujtaba8488/package_country_currency_chooser/blob/master/showcase/currency_chooser_01.gif)
</details>

## Feedback

Kindly email me directly for any feedback and hit the like button.
