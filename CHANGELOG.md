# ChangeLog

## 1.0.1+1 [Flutter 3.0]
### Friday, 9th June, 2022
* Minor fixes and improvements
## 1.0.0 [Flutter 3.0]
### Friday, 3rd June, 2022

* Update to Flutter 3.0
* Fix android 2 embedding issue
* Fix Warning: Operand of null-aware operation '?.' has type 'WidgetsBinding' which excludes null-- Thank you [Redeemer Pace](https://github.com/red-game-dev)
* Fix lint warnings -- Thank you [TheMeanCanEHdian](https://github.com/TheMeanCanEHdian) 
* Add line padding -- Thank you [Mateusz](https://github.com/matheowis)

## 0.1.3 [Null safety]

### Friday, 5th March, 2021

* Added null safety support @thank you [Renan Luiz Arceno](https://github.com/renanarceno)

## 0.1.2+10 [Blinking Issue / Alignment Property]

### Wednesday, 3rd February, 2021

* __Breaking Changes Icon/Image/Number Steppers__: `goNext`, `goPrevious`, and `Foo.externallyControlled` properties and constructors have removed from Icon, Image, Number Steppers.

  * Renamed `enableNextPreviousButtons` to `nextPreviousButtonsDisabled`.

  * Renamed `enabledStepTapping` to `stepTappingDisabled`.

* Fixed the blinking_bug [github #15](https://github.com/imujtaba8488/package_im_stepper/issues/15)

* Added the `alignment` property to align the Image/Icon/Number Steppers. [github #16](https://github.com/imujtaba8488/package_im_stepper/issues/15)

* Refactored.

* Documentation improvements.

## 0.1.2+9 [DotStepper Revamped]

### Thursday, 8th January, 2021

The DotStepper has been completely revamped to include several new exciting features, such as, setting spacing between dots (github issue), showing line connectors, etc. Modern indicator effects and shapes have also been added. However, some of the following breaking changes happened along the way:-

* __Breaking Change:__ Indicator effect such as `bullet`, `trail`, `jump_form_above`, and `jump_from_below` have been removed and new modern effects have been introduced.

* __Breaking Change:__ Following properties have either been removed, moved or renamed to make controlling and customizing the `DotStepper` a breeze:-
  
| __Property__      | __Removed__ | __Renamed__   | __Moved__   |
|-------------------|-------------|---------------|-------------|
| `goNext`          | Yes         | \-            | \-          |
| `goPrevious`      | Yes         | \-            | \-          |
| `upperBound`      | Yes         | \-            | \-          |
| `lowerBound`      | Yes         | \-            | \-          |
| `dotReachedIndex` | \-          | `onDotTapped` | \-          |
| `dotColor`        | \-          | \-            | Decorations |
| `indicatorColor`  | \-          | \-            | Decorations |
| `fillStep`        | \-          | \-            | Decorations |
| `indicatorEffect` | \-          | `Indicator`   | \-          |
| `indicatorType`   | Yes         | \-            | \-          |
| `dotShape`        | \-          | `shape`       | \-          |

* Following new properties have been added:-

| **Property**              | **Description**                                  |
|---------------------------|--------------------------------------------------|
| `spacing`                 | Sets the spacing between dots                    |
| `lineConnectorsEnabled`   | Enables or disables line connectors between dots |
| `tappingEnabled`          | Enables or disables tapping on dots              |
| `fixedDotDecoration`      | Decorates fixedDots                              |
| `indicatorDecoration`     | Decorates the indicator                          |
| `lineConnectorDecoration` | Decorates the lineConnectors between dots        |

* LineConnectors have been added.

* Spacing can now be set between the dots @github issues [11](https://github.com/imujtaba8488/package_im_stepper/issues/11).

* Documentation improvements.

* Many thanks to [Elliot](https://github.com/zelliot) for his continuous support.

## 0.1.2+8

### Saturday, 28th November, 2020

* __Breaking Change:__ The DotShape property __`line`__ renamed to __`dash`__.

* `goNext`, `goPrevious`, and `Foo.externallyControlled` properties and constructors deprecated and __will be removed in version 0.1.3__ from Icon, Image, Number, and Dot Steppers. Instead, introduced the `activeStep` property, a __simpler__ approach to control the steppers either from built-in buttons, by tapping, or from external buttons. @github issues: [#5](https://github.com/imujtaba8488/package_im_stepper/issues/5), [#9](https://github.com/imujtaba8488/package_im_stepper/issues/9).

* The `activeStep` can also be used to either set the initial step or jump to any step. @github issues: [#7](https://github.com/imujtaba8488/package_im_stepper/issues/7)

* Deprecated the `dotReachedIndex` property in the DotStepper. This function is now redundant as the same can be tracked using the `activeStep` property.

* Two new function properties introduced in DotStepper; `lowerBound` and `upperBound`. These maybe required in conditionals to control stepping forward and backward using the `activeStep`.

* __BugFix:__ Previous button icon not working @github issue: [#8](https://github.com/imujtaba8488/package_im_stepper/issues/8)

* Updated the documentation.

* Many thanks to: [elliot](https://github.com/zelliot), [MastPollo10](https://github.com/Mastpollo10), [atul-khemka](https://github.com/atul-khemka), and [thfr69](https://github.com/thfr69)

## 0.1.2+6

### Thursday, 15th October, 2020

* __BugFix:__ FlutterError (_OpacityAnimatedState#aa454(ticker active) was disposed with an active Ticker, [pull request](https://github.com/imujtaba8488/package_im_stepper/pull/6) by [mattbreeland](https://github.com/mattbreeland)

## 0.1.2+5

### Sunday, 20th September, 2020

* IconStepper, ImageStepper, and NumberStepper can now be controlled from external buttons, by using the relevant constructor marked as `FooStepper.externallyControlled`. @ github issues [#3](https://github.com/imujtaba8488/package_im_stepper/issues/3) and [#4](https://github.com/imujtaba8488/package_im_stepper/issues/4)

* Added the option to disable scrolling the stepper, if required.

* Refactored the code.

* Updated example to include using an externally controller stepper.

* Documentation improvements.

## 0.1.2+4

### Saturday, 29th August, 2020

* Added NumberStepper.

## 0.1.2+3

### Friday, 28th August, 2020

* Added __ImageStepper__ widget. Thanks @[Liliana99](https://github.com/imujtaba8488/package_im_stepper/issues/2)

* Refactored and optimized the code.

* Updated the documentation.

* Updated the examples.

## 0.1.2+2

### Wednesday, 19th August, 2020

* Added Dot Shapes to DotStepper.

## 0.1.2+1

### Tuesday, 18th August, 2020

* Added DotStepper.
* Added example for DotStepper

## 0.1.1

### Wednesday, 5th August, 2020

* __BugFix:__ couldn't set color and other properties for the DottedLine when in
vertical mode.

* Added the option to _enable and disable stepping_ that could benefit validation
before the next step is reached. Thanks @ Mohamed Elyamani

* Refactored & optimized the code.

## 0.1.0

### Sunday, 19th July, 2020

* Initial release.

* Added IconStepper.
