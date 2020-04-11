import 'dart:async';

import 'package:covid_19_mob/pages/home/home.dart';
import 'package:covid_19_mob/theme/metrics.dart';
import 'package:covid_19_mob/utils/constants.dart';
import 'package:covid_19_mob/utils/image_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.route_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: whiteColor, // navigation bar color
      statusBarColor: whiteColor, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.dark, //navigation bar icons' color
    ));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image_logo,
                width: 140,
                height: 140,
              ),
              Container(
                width: 180,
                padding: padding_child_vertical,
                child: Text(
                  'COVID 19 Information',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
