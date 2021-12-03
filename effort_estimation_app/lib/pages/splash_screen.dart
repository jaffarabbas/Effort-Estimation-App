// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:effort_estimation_app/containers/_text.dart';
import 'package:effort_estimation_app/pages/home_page.dart';
import 'package:effort_estimation_app/widgits/mediaQuery.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ),
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextArea('EFFORT',Resposive.ResponsiveWidth(context, 0.1)),
             TextArea('ESTIMATION',Resposive.ResponsiveWidth(context, 0.1)),
             TextArea('APP',Resposive.ResponsiveWidth(context, 0.1)),
          ],
        ),
      ),
    );
  }
}