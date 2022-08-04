import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    Modular.to.pushReplacementNamed("/login/");
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFD9DADA), Color(0xFFA7A7A7)],
                  stops: [0.3, 1]),
            ),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Image.asset("assets/logo-servicos.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "Serviços On-line",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    fontSize: 33,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "Município de Rio Branco",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                )),
              ],
            ),
          ),
        );

    // SystemChrome.setEnabledSystemUIOverlays([]);

    return PageView(
      children: <Widget>[
        _buildBodyBack(),
      ],
    );
  }
}
