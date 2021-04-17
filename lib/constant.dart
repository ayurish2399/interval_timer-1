import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 9,
      constraints: BoxConstraints.tightFor(height: 56, width: 40),
      shape: CircleBorder(),
      fillColor: Colors.lightGreen,
    );
  }
}

class TimerUnits {
  int hr;
  int min;
  int sec;
  int breakHr;
  int breakMin;
  int breakSec;
  int sets;

  TimerUnits(
      {@required this.hr,
      @required this.min,
      @required this.sec,
      @required this.breakHr,
      @required this.breakMin,
      @required this.breakSec,
      @required this.sets});
}

int totalTimeinSeconds(
    {int hr, int min, int sec, int bHr, int bMin, int bSec, int sets}) {
  return ((hr + bHr) * 3600 + (bMin + min) * 60 + (sec + bSec)) * sets -
      (bHr * 3600 + bMin * 60 + bSec);
}

String formatTimer({int timeForTimer}) {
  String timetoDisplay;
  if (timeForTimer < 60) {
    timetoDisplay = '${(timeForTimer <= 9 && timeForTimer >= 0) ? '0' : ''}' +
        timeForTimer.toString();
  } else if (timeForTimer < 3600) {
    int m = timeForTimer ~/ 60;
    int s = timeForTimer - (60 * m);
    timetoDisplay = '${(m <= 9 && m >= 0) ? '0' : ''}' +
        m.toString() +
        " : " +
        '${(s <= 9 && s >= 0) ? '0' : ''}' +
        s.toString();
  } else {
    int h = timeForTimer ~/ 3600;
    int t = timeForTimer - (3600 * h);
    int m = t ~/ 60;
    int s = t - (60 * m);
    timetoDisplay = '${(h <= 9 && h >= 0) ? '0' : ''}' +
        h.toString() +
        " : " +
        '${(m <= 9 && m >= 0) ? '0' : ''}' +
        m.toString() +
        " : " +
        '${(s <= 9 && s >= 0) ? '0' : ''}' +
        s.toString();
  }

  return timetoDisplay;
}

String progress({double timeForTimer, double totalTime}) {
  double progress;
  if (((totalTime - timeForTimer) / totalTime) <= 0 ||
      ((totalTime - timeForTimer) / totalTime) == double.infinity ||
      ((totalTime - timeForTimer) / totalTime) == double.nan) {
    progress = 0;
  } else {
    progress = ((totalTime - timeForTimer) / totalTime) * 100;
  }
  return '${progress.toInt()} ' + '%';
}

int timeInSeconds({int hr, int min, int sec}) {
  return hr * 3600 + min * 60 + sec;
}
