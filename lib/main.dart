import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app_2024/core/shared/network/remote_data/api_manger_http.dart';
import 'feature/setting/control/cubit/radio_select_cubit.dart';
import 'feature/view_news/presention/conterol/source_cubit.dart';
import 'my_app.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.amber, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness: Brightness.dark, // color of navigation controls
  ));
  runApp(
      MultiBlocProvider(providers: [
        BlocProvider<SourceCubit>(
          create: (context) => SourceCubit(remoteApi: ApiManagerHttp()),
        ),
        BlocProvider<RadioSelectCubit>(
          create: (context) => RadioSelectCubit(),
        ),
      ],
        child:  EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const MyApp()),)

 );
}

