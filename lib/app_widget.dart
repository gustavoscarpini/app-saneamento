import 'package:appcontribuinte/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portal do Contribuinte',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData(
          primaryColor: primaryColor,
          backgroundColor: Colors.white,
          canvasColor: Colors.transparent,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          })),
      // home: new SplashPage(),
    );
//        home: LoginModule());
  }
}
