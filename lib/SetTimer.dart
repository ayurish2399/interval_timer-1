import 'constant.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'Timer.dart';

class SetTimer extends StatefulWidget {
  @override
  _SetTimerState createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {
  int hr = 0;
  int min = 0;
  int sec = 0;
  int breakHr = 0;
  int breakMin = 0;
  int breakSec = 0;
  int sets = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Timer',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
                SizedBox(width: 162),
                RoundButton(
                    icon: Icons.play_arrow,
                    onPressed: () {
                      TimerUnits u = TimerUnits(
                          hr: hr,
                          min: min,
                          sec: sec,
                          breakHr: breakHr,
                          breakMin: breakMin,
                          breakSec: breakSec,
                          sets: sets);
                      if (hr == 0 && min == 0 && sec == 0) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Empty value'),
                                content: Text(
                                  'Time For Workout cannot be empty',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Okay'),
                                  ),
                                ],
                              );
                            });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Timer(
                              unit: u,
                            ),
                          ),
                        );
                      }
                    }),
                SizedBox(width: 11),
                RoundButton(
                  icon: Icons.person,
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            Column(
              children: [
                Text(
                  'Time for workout'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'HH',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        NumberPicker(
                            minValue: 0,
                            maxValue: 23,
                            value: hr,
                            onChanged: (val) {
                              setState(() {
                                hr = val;
                              });
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'MM',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        NumberPicker(
                            minValue: 0,
                            maxValue: 59,
                            value: min,
                            onChanged: (val) {
                              setState(() {
                                min = val;
                              });
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'SS',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        NumberPicker(
                            minValue: 0,
                            maxValue: 59,
                            value: sec,
                            onChanged: (val) {
                              setState(() {
                                sec = val;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  'Break'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'HH',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        NumberPicker(
                            minValue: 0,
                            maxValue: 23,
                            value: breakHr,
                            onChanged: (val) {
                              setState(() {
                                breakHr = val;
                              });
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'MM',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        NumberPicker(
                            minValue: 0,
                            maxValue: 59,
                            value: breakMin,
                            onChanged: (val) {
                              setState(() {
                                breakMin = val;
                              });
                            }),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'SS',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        NumberPicker(
                            minValue: 0,
                            maxValue: 59,
                            value: breakSec,
                            onChanged: (val) {
                              setState(() {
                                breakSec = val;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Sets'.toUpperCase(),
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w300, letterSpacing: 2),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(
                    icon: Icons.remove,
                    onPressed: () {
                      setState(() {
                        if (sets > 1) {
                          sets--;
                        } else {
                          sets = 1;
                        }
                      });
                    }),
                SizedBox(
                  width: 30,
                ),
                Text(
                  '$sets',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 30,
                ),
                RoundButton(
                    icon: Icons.add,
                    onPressed: () {
                      setState(() {
                        if (sets < 100) {
                          sets++;
                        } else {
                          sets = 100;
                        }
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
