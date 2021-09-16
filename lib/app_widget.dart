import 'package:appcontribuinte/constants.dart';
import 'package:appcontribuinte/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Portal do Contribuinte',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: primaryColor,
            backgroundColor: Colors.white,
            canvasColor: Colors.transparent,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            })),
        home: new SplashPage(),
        initialRoute: '/',
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute);
//        home: LoginModule());
  }
}
