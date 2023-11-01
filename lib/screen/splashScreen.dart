import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8c60a3),
      body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/images/exam.png', height: 300, width: 300,),
            ),
            Container(
              height: 400.0,
              alignment: Alignment.bottomCenter,
                child: Text(
                  'Mari Belajar',
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
            )
          ],
        )
    );
  }
}
