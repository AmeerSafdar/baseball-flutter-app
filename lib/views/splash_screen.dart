import 'dart:async';

import 'package:baseball/views/home_page.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    // Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context) => LoginScreen()
    //   )
    // );
    // Get.offAll(
    //   HomePage(),
    //   transition: Transition.rightToLeftWithFade
    // );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }

  initScreen(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          // alignment: alih,
              child: Image.asset(
                "assets/images/flutter.png",
                ),
        ),
      ),
    );
  }
}