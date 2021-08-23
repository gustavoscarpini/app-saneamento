import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Carregando extends StatelessWidget {
  bool inverter;

  Carregando({this.inverter = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
          child: SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
              this.inverter ? Color(0xFF25476A) : Colors.white),
        ),
      )),
    );
  }
}
