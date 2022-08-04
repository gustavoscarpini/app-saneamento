import 'package:appcontribuinte/components/carregando.dart';
import 'package:appcontribuinte/components/custom_alert.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'home_controller.dart';

class ConfirmCodePage extends StatefulWidget {
  @override
  _ConfirmCodePageState createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage> with Disposable {
  var homeController = Modular.get<HomeController>();

  String codigo = "";

  @override
  void initState() {
    super.initState();
    homeController.solicitarAcessoAoDispositivo().then((value) {
      if (homeController.solicitacaoDispositivo != null &&
          homeController.solicitacaoDispositivo!.valido!) {
        Navigator.pushReplacementNamed(context, "/home");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child:
            Container(alignment: Alignment.bottomCenter, color: secundaryColor),
      ),
      body: Observer(
        builder: (_) {
          return SafeArea(
            child: Container(
              color: Colors.black12,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColorContainer,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.2, 0.8],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .55,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding:
                        new EdgeInsets.only(top: 50, right: 15.0, left: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Portal do Contribuínte",
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 1,
                          margin: EdgeInsets.only(top: 50),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: homeController.isLoading
                                    ? Center(
                                        child: Carregando(
                                        inverter: true,
                                      ))
                                    : painelCodeDigits(context),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container painelCodeDigits(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.only(left: 10, top: 20, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: AutoSizeText(
                    "Bem vindo, ${homeController.user?.pessoa?.nome}",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AutoSizeText(
                "Antes de continuar é necessário efutar a validação desse dispositivo.",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(fontSize: 18, color: Colors.black)),
            SizedBox(
              height: 20,
            ),
            AutoSizeText(
                "Informe o código de 6 digitos que foi enviado no email ${homeController.user?.pessoa?.email}",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(fontSize: 18, color: Colors.black)),
            SizedBox(
              height: 50,
            ),
            VerificationCode(
              keyboardType: TextInputType.number,
              length: 6,
              autofocus: false,
              onCompleted: (String value) {
                print(value);
                setState(() {
                  homeController.confirmarDispositivo(value).then((value) {
                    if (homeController.validouCodigo) {
                      Navigator.pushReplacementNamed(context, "/home");
                    } else {
                      CustomAlert.show(context,
                          title: "Código não confere",
                          subTitle:
                              "O código informado não confere com o enviado, caso não o tenha recebido pressione 'Enviar Novo Código'.",
                          style: AlertStyle.error);
                    }
                  });
                });
              },
              onEditing: (bool value) {},
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                child: Text("Enviar Novo Código",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                onPressed: () async {
                  homeController.solicitarAcessoAoDispositivo().then((value) {
                    setState(() {
                      //so p recarregar
                    });
                  });
                }),
          ],
        ));
  }
}

addItemActionListener(context, homeController, text, onTap, icon) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    elevation: 1,
    color: Colors.white,
    child: GestureDetector(
      onTap: onTap,
      child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icon,
              SizedBox(height: 5),
              Center(
                  child: Text(
                text,
                style: GoogleFonts.raleway(color: Colors.black54, fontSize: 12),
                textAlign: TextAlign.center,
              )),
            ]),
      ),
    ));
