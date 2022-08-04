import 'package:appcontribuinte/components/button_widget.dart';
import 'package:appcontribuinte/config/config_controller.dart';
import 'package:appcontribuinte/config/config_module.dart';
import 'package:appcontribuinte/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  var configController = Modular.get<ConfigController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0.0,
        backgroundColor: primaryColor,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColorContainer,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.8],
              ),
            ),
            child: SafeArea(
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 100),
                    child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "${configController.usuario?.pessoa!.nome}",
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Text( "Rio Branco",
                                style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Divider(height: 0),
                        Divider(height: 0),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed("perfil");
                          },
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.person_outline),
                          title: Text("Perfil"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        Divider(height: 0),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("legislacao");
                          },
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.book),
                          title: Text("Legislação"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
//                            Divider(height: 0),
//                            ListTile(
//                              contentPadding: EdgeInsets.all(0),
//                              leading: Icon(Icons.phone_iphone),
//                              title: Text("Configurações do app"),
//                              trailing: Icon(Icons.keyboard_arrow_right),
//                            ),
                        Divider(height: 0),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed("sobre");
                          },
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.help),
                          title: Text("Sobre o app"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                        Divider(height: 0),
                        SizedBox(height: 30),
                        ButtonWidget(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/login");
                          },
                          text: "SAIR DA CONTA",
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
