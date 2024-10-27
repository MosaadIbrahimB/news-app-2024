import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_2024/feature/view_news/presention/screen/home_screen.dart';

class SplashScreen extends StatelessWidget {

  static String nameRoute = "SplashScreen";

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {

    goToLayOutScreen(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image:  DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/pattern.png"))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: Center(
            child:   Image.asset(
          "assets/images/logo.png",
          width: 189.w,
          height: 211.h,
        ),

          ),),
    );
  }

  goToLayOutScreen(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        if(context.mounted){
      Navigator.pushReplacementNamed(context, HomeScreen.nameRoute);
        }
      },
    );

  }
}
