import 'package:nomeyho_clock/model/time.dart';

///
/// A digit is represented by segments on a digital display
/// (e.g. 7-segment display).
///
/// This method returns an array of 6 [Time] values that corresponds to
/// the segments of the provided [digit].
///
/// Each time value represents up to two segments once rendered as an analog
/// clock (one for the hour hand and one for the minute hand).
///
/// Combining the appropriate time values, the six clocks effectively
/// represent the provided digit once laid out in a 2-by-3 grid.
/// For digit 8, we have:
/// 🕞🕤
/// 🕒🕘
/// 🕒🕘
List<Time> getTimesForDigit(int digit) {
  if (digit < 0 || digit > 9) {
    throw ArgumentError("Digit is not in range [0-9]");
  }
  return _digitToTime[digit];
}

// TODO fix animation continuity => shortest path
const _digitToTime = [
  // 0
  [
    const Time(hours: 6, minutes: 15),
    const Time(hours: 9, minutes: 30),
    const Time(hours: 6, minutes: 0),
    const Time(hours: 0, minutes: 30),
    const Time(hours: 3, minutes: 0),
    const Time(hours: 0, minutes: 45),
  ],
  // 1
  [
    const Time(hours: 7.5, minutes: 37.5),
    const Time(hours: 6, minutes: 30), // TODO
    const Time(hours: 7.5, minutes: 37.5),
    const Time(hours: 0, minutes: 30),
    const Time(hours: 7.5, minutes: 37.5),
    const Time(hours: 0, minutes: 0) // TODO
  ],
  // 2
  [
    const Time(hours: 3, minutes: 15),
    const Time(hours: 9, minutes: 30),
    const Time(hours: 6, minutes: 15),
    const Time(hours: 0, minutes: 45),
    const Time(hours: 0, minutes: 15),
    const Time(hours: 9, minutes: 45)
  ],
  // 3
  [
    const Time(hours: 3, minutes: 15),
    const Time(hours: 9, minutes: 30),
    const Time(hours: 3, minutes: 15),
    const Time(hours: 9, minutes: 0),
    const Time(hours: 3, minutes: 15),
    const Time(hours: 9, minutes: 0)
  ],
  // 4
  [
    const Time(hours: 6, minutes: 30),
    const Time(hours: 6, minutes: 30),
    const Time(hours: 0, minutes: 15),
    const Time(hours: 6, minutes: 0),
    const Time(hours: 7.5, minutes: 37.5),
    const Time(hours: 0, minutes: 0)
  ],
  // 5
  [
    const Time(hours: 6, minutes: 15),
    const Time(hours: 9, minutes: 45),
    const Time(hours: 0, minutes: 15),
    const Time(hours: 6, minutes: 45),
    const Time(hours: 3, minutes: 15),
    const Time(hours: 0, minutes: 45)
  ],
  // 6
  [
    const Time(hours: 6, minutes: 15),
    const Time(hours: 9, minutes: 45),
    const Time(hours: 6, minutes: 0),
    const Time(hours: 6, minutes: 45),
    const Time(hours: 0, minutes: 15),
    const Time(hours: 0, minutes: 45)
  ],
  // 7
  [
    const Time(hours: 3, minutes: 15),
    const Time(hours: 6, minutes: 45),
    const Time(hours: 7.5, minutes: 37.5),
    const Time(hours: 6, minutes: 0),
    const Time(hours: 7.5, minutes: 37.5),
    const Time(hours: 0, minutes: 0)
  ],
  // 8
  [
    const Time(hours: 6, minutes: 15),
    const Time(hours: 6, minutes: 45),
    const Time(hours: 0, minutes: 15),
    const Time(hours: 0, minutes: 45),
    const Time(hours: 0, minutes: 15),
    const Time(hours: 0, minutes: 45)
  ],
  // 9
  [
    const Time(hours: 6, minutes: 15),
    const Time(hours: 6, minutes: 45),
    const Time(hours: 0, minutes: 15),
    const Time(hours: 0, minutes: 45),
    const Time(hours: 3, minutes: 15),
    const Time(hours: 0, minutes: 45)
  ],
];
