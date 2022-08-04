import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function? onPressed;
  final double? height;
  final Icon? icon;
  final double fontSize;

  const ButtonWidget({
    Key? key,
    this.text,
    this.color,
    this.height,
    this.onPressed,
    this.icon,
    this.fontSize = 14
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height != null ? height : 60,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.003),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color!),
        ),
        child: SizedBox.expand(
          child: FlatButton(
              onPressed: onPressed as void Function()?,
              child: Row(
                mainAxisAlignment: icon != null? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
                children: <Widget>[
                  icon !=null ? icon!: Container(),
                  Text(
                    text!,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w600,
                        color: color,
                        fontSize: fontSize),
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
        ));
  }
}
