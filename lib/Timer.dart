import 'constant.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

// ignore: must_be_immutable
class Timer extends StatefulWidget {
  TimerUnits unit;
  Timer({Key key, @required this.unit}) : super(key: key);

  @override
  _TimerState createState() => _TimerState(unit);
}

class _TimerState extends State<Timer> {
  //for circular timer
  CountDownController _controller = CountDownController();
  // for digital timer
  CountdownController _countdownController = CountdownController();
  // for progress indicator
  CountdownController _cntdwnController = CountdownController();
  int _curIndex = 1;
  TimerUnits unit;
  _TimerState(this.unit);
  bool workout = false;
  bool rest = false;
  Widget startTimer;
  Widget workoutTimer;
  Widget restTimer;
  int ctr = 0;
  int currentSetNumber = 1;
  List<String> mode = ['Starting in...', 'Workout Time', 'Take a Break'];

  @override
  Widget build(BuildContext context) {
    int ttinSec = totalTimeinSeconds(
        bHr: unit.breakHr,
        bMin: unit.breakMin,
        bSec: unit.breakSec,
        hr: unit.hr,
        min: unit.min,
        sec: unit.sec,
        sets: unit.sets);
    // For starting countdown
    List<Widget> change = [
      CircularCountDownTimer(
        key: Key('1'),
        width: MediaQuery.of(context).size.width / 2 + 50,
        height: MediaQuery.of(context).size.height / 2,
        fillColor: Colors.yellow[900],
        onComplete: () {
          setState(() {
            if (workout == false && rest == false) {
              ctr = 1;
              workout = true;
              rest = false;
            }
          });
        },
        duration: 5,
        ringColor: Color(0xff3F0090),
        controller: _controller,
        backgroundColor: Color(0xff3F0055),
        strokeWidth: 15,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(fontSize: 40, color: Colors.yellow[900]),
        isTimerTextShown: true,
        isReverse: true,
        isReverseAnimation: false,
      ),
      // For Workout timer
      CircularCountDownTimer(
        key: Key('2'),
        width: MediaQuery.of(context).size.width / 2 + 50,
        height: MediaQuery.of(context).size.height / 2,
        fillColor: Color(0xff21BDFA),
        textFormat:
            (timeInSeconds(hr: unit.hr, min: unit.min, sec: unit.sec) < 3600)
                ? CountdownTextFormat.MM_SS
                : CountdownTextFormat.HH_MM_SS,
        duration: timeInSeconds(hr: unit.hr, min: unit.min, sec: unit.sec),
        onComplete: () {
          if (workout == true && rest == false) {
            if (currentSetNumber < unit.sets) {
              setState(() {
                currentSetNumber++;
                if (unit.breakHr == 0 &&
                    unit.breakMin == 0 &&
                    unit.breakSec == 0) {
                  ctr = 1;
                  workout = true;
                  rest = false;
                  _controller.restart();
                } else {
                  ctr = 2;
                  workout = false;
                  rest = true;
                }
              });
            } else {
              Navigator.pop(context);
            }
          }
        },
        ringColor: Color(0xff211F4F),
        controller: _controller,
        backgroundColor: Color(0xff101245),
        strokeWidth: 15,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(fontSize: 40, color: Color(0xff21BDFA)),
        isTimerTextShown: true,
        isReverse: true,
        isReverseAnimation: false,
      ),
      // For break timer
      CircularCountDownTimer(
        key: Key('3'),
        width: MediaQuery.of(context).size.width / 2 + 50,
        height: MediaQuery.of(context).size.height / 2,
        fillColor: Colors.lightGreenAccent,
        textFormat: (timeInSeconds(
                    hr: unit.breakHr, min: unit.breakMin, sec: unit.breakSec) <
                3600)
            ? CountdownTextFormat.MM_SS
            : CountdownTextFormat.HH_MM_SS,
        duration: timeInSeconds(
            hr: unit.breakHr, min: unit.breakMin, sec: unit.breakSec),
        onComplete: () {
          if (workout == false && rest == true) {
            setState(() {
              ctr = 1;
              workout = true;
              rest = false;
            });
          }
        },
        ringColor: Color(0xff211F4F),
        ringGradient: LinearGradient(colors: [
          Colors.green,
          Colors.lightGreen,
        ]),
        controller: _controller,
        backgroundColor: Color(0xff81B214),
        strokeWidth: 15,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(fontSize: 40, color: Colors.lightGreenAccent),
        isTimerTextShown: true,
        isReverse: true,
        isReverseAnimation: false,
      ),
    ];
    return Scaffold(
      backgroundColor: (ctr == 0)
          ? Color(0xff3F0055)
          : (ctr == 1)
              ? Color(0xff101245)
              : Color(0xff81B214),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: change[ctr],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: (ctr == 0)
                      ? Color(0xff3F0032)
                      : (ctr == 1)
                          ? Color(0xff171D5F)
                          : Color(0xff1F441E),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                width: double.infinity,
                child: ListView(
                  children: [
                    SizedBox(height: 20),
                    ListTile(
                      title: Text(
                        'Interval'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 1.5,
                            fontFamily: 'OverPass'),
                      ),
                      trailing: Text(
                        "$currentSetNumber" + " / " + "${unit.sets}",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      title: AnimatedSwitcher(
                        duration: Duration(milliseconds: 1000),
                        child: Text(
                          '${mode[ctr]}'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 37,
                              letterSpacing: 2,
                              fontFamily: 'OverPass'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      title: Text(
                        'Time Elapsed'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'OverPass',
                          letterSpacing: 1.7,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: (ctr > 0)
                          ? Countdown(
                              controller: _countdownController,
                              seconds: ttinSec - 1,
                              build: (_, double time) => Text(
                                formatTimer(timeForTimer: time.toInt()),
                                style: TextStyle(fontSize: 30),
                              ),
                            )
                          : Text(
                              'Get Ready'.toUpperCase(),
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      title: Text(
                        'Progress'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'OverPass',
                            letterSpacing: 1.7,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: (ctr > 0)
                          ? Countdown(
                              controller: _cntdwnController,
                              seconds: (ttinSec == 1) ? ttinSec : ttinSec - 1,
                              build: (_, double time) => Text(
                                progress(
                                  timeForTimer: time,
                                  totalTime: ttinSec.toDouble() - 1,
                                ),
                                style: TextStyle(fontSize: 30),
                              ),
                            )
                          : Text(
                              'Get Ready'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'OverPass',
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pause),
            label: 'Pause',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Play'),
          BottomNavigationBarItem(
              icon: Icon(Icons.refresh_outlined), label: 'Restart'),
        ],
        onTap: (index) {
          if (ctr != 0) {
            setState(() {
              _curIndex = index;

              switch (index) {
                case 0:
                  _controller.pause();
                  _countdownController.pause();
                  _cntdwnController.pause();
                  break;
                case 1:
                  _controller.resume();
                  _countdownController.resume();
                  _cntdwnController.resume();
                  break;
                case 2:
                  ctr = 1;
                  currentSetNumber = 1;
                  workout = true;
                  rest = false;
                  _controller.restart();
                  _countdownController.restart();
                  _cntdwnController.restart();
              }
            });
          }
        },
      ),
    );
  }
}
