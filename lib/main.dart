import 'package:baseball/views/home_page.dart';
import 'package:baseball/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
            theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'base ball',
      home:SplashScreen() ,
    );
  }
}

