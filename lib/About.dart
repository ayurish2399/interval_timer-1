import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              'This app is developed by : - ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.limeAccent[400],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            CircleAvatar(
              backgroundImage: AssetImage('images/Aman.png'),
              radius: 87,
            ),
            SizedBox(height: 25),
            Text(
              'Aman Kumar',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Comic',
              ),
            ),
            Text(
              'Phone:  +91943595XXXX',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Text(
              'Email: aman.kumar_cs18@gla.ac.in',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              color: Colors.orange,
              thickness: 10,
            ),
            SizedBox(height: 25),
            CircleAvatar(
              backgroundImage: AssetImage('images/Ayurish.png'),
              radius: 87,
            ),
            SizedBox(height: 25),
            Text(
              'Ayurish Chandana',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Comic',
              ),
            ),
            Text(
              'Phone:  +91948456XXXX',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Text(
              'Email: ayurish.chandna_cs18@gla.ac.in',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
