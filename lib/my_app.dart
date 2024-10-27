import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/splash/presentation/screen/splash_screen.dart';
import 'feature/view_news/presention/screen/details_screen.dart';
import 'feature/view_news/presention/screen/home_screen.dart';
import 'feature/view_news/presention/screen/setting_screen.dart';
import 'feature/view_news/presention/screen/web_view_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.nameRoute,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routes: {
            SplashScreen.nameRoute: (context) =>  SplashScreen(),
            HomeScreen.nameRoute: (context) =>  HomeScreen(),
            DetailsScreen.nameRoute: (context) => const DetailsScreen(),
          },
        );
      },
    );


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.nameRoute,
      routes: {
        HomeScreen.nameRoute: (context) =>  HomeScreen(),
        DetailsScreen.nameRoute: (context) => const DetailsScreen(),
      },
    );
  }
}

