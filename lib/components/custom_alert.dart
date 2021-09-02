import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CustomAlert {
  static void show(BuildContext context,
      {String title,
      String subTitle,
      AlertStyle style,
      Function onConfirm,
      String textConfirm: "Continuar"}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: EdgeInsets.only(left: 10, top: 20, right: 10),
              decoration: BoxDecoration(
                  color: style == AlertStyle.error
                      ? Colors.redAccent
                      : style == AlertStyle.warning
                          ? Colors.deepOrange
                          : Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: AutoSizeText("$title",
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: AutoSizeText("$subTitle",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  fontSize: 15, color: Colors.white)),
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            child: Text(
                                '${textConfirm != null ? textConfirm : 'Continuar'}',
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onPressed: () async {
                              if (onConfirm != null) {
                                onConfirm();
                              } else {
                                Navigator.pop(context);
                              }
                            })
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}

enum AlertStyle { success, error, warning, confirm, loading }
