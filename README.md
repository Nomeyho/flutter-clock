# Nomeyho clock
> A digital clock made of analog clocks.

Submitted for the [Flutter Clock Challenge](https://flutter.dev/clock).

[VIDEO HERE]

## Presentation
The Nomeyho clock is a digital clock that displays the current date and time.
It combines digital and analog clocks in a unique way.
<p align="center">
    <img src='screenshots/dark_theme.png' width='600'>
</p>

### Digits
Each digit of the Nomeyho clock is constructed using six analog clocks, laid out in a 2-by-3 grid.
The segments composing each digit are made-up of the analog clock hands.
Each digit from 0 to 9 can be represented by analog clocks set to the appropriate time.

<p align="center">
    <img src='screenshots/0.png' width='100'>
    <img src='screenshots/1.png' width='100'>
    <img src='screenshots/2.png' width='100'>
    <img src='screenshots/3.png' width='100'>
    <img src='screenshots/4.png' width='100'>
</p>
<p align="center">
    <img src='screenshots/5.png' width='100'>
    <img src='screenshots/6.png' width='100'>
    <img src='screenshots/7.png' width='100'>
    <img src='screenshots/8.png' width='100'>
    <img src='screenshots/9.png' width='100'>
</p>

### Animation
The transition between the digit makes the Nomeyho clock special. One or more digit change every minute.
The individual analog clocks have to display a new time and the hands simultaneously rotates clockwise to
reach their new position. The unused hands will fade out to improve the readability of the overall digit.

<img src='screenshots/animation.gif' width='120'>

### Details
A particular attention was given to the following details:
* **Clock hand ends**: the clock hands are rounded on one end only. It ensures continuity of straight
the segments and gives *smooth* corners to the digits.

* **Readability**: a different color was used for the hour digits and for the minutes digits.
The colors create a clear separation between the two group of digits and makes the reading easier.

### Theme
A light theme is also available:

<p align="center">
    <img src='screenshots/light_theme.png' width='600'>
</p>

## Intl
The current date can be displayed in multiple languages thanks to
the [intl](https://pub.dev/packages/intl) package. Both 12-hour format and 24-hour format are supported.

<p align="center">
    <img src='screenshots/french.png' width='350'>
    <img src='screenshots/spanish.png' width='350'>
</p>

## Credits
* [ClockClock 24](https://clockclock.com/) for the inspiration
* [Barlow](https://fonts.google.com/specimen/Barlow) for the font
* The Flutter team for the awesome framework
