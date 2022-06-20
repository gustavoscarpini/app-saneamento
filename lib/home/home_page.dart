import 'dart:async';

import 'package:appcontribuinte/components/custom_alert.dart';
import 'package:appcontribuinte/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Disposable {
  var homeController = Modular.get<HomeController>();

  late Timer _everySecond;

  @override
  void initState() {
    super.initState();
    homeController.carregar().then((value) {
      if (homeController.user != null) {
        setState(() {
          CustomAlert.show(context,
              title: "Olá ${homeController.user!.pessoa!.nome}",
              subTitle: "Seja bem vindo!",
              style: AlertStyle.success);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _everySecond.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Column(
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
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding:
                        new EdgeInsets.only(top: 20, right: 15.0, left: 15.0),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed("perfil");
                                },
                              ),
                              Text("Portal do Contribuínte",
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500)),
                              IconButton(
                                icon: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 1,
                                    margin: EdgeInsets.only(top: 50),
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 30, bottom: 10),
                                                padding: EdgeInsets.only(
                                                    left: 15, top: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: AutoSizeText(
                                                        "${homeController.user!.pessoa!.nome}",
                                                        maxLines: 1,
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: AutoSizeText(
                                                        "${homeController.user!.pessoa!.email}",
                                                        maxLines: 1,
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 16.0),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text('CPF',
                                                            style: GoogleFonts
                                                                .raleway()),
                                                        Text(
                                                          "${homeController.user!.pessoa!.cpfCnpj}",
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black54),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text('RG',
                                                            style: GoogleFonts
                                                                .raleway()),
                                                        Text(
                                                          "${homeController.user!.pessoa!.rgInscricao}",
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black54),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: homeController.user != null &&
                                                homeController.user!.pessoa !=
                                                    null &&
                                                homeController
                                                        .user!.pessoa!.foto !=
                                                    null &&
                                                homeController.user!.pessoa!.foto!
                                                        .file !=
                                                    null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.file(
                                                  homeController
                                                      .user!.pessoa!.foto!.file!,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.fill,
                                                ),
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                width: 100,
                                                height: 100,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: GridView.count(
                              //cria um grid com 2 colunas
                              crossAxisCount: 3,
                              // Gera 100 Widgets que exibem o seu índice na lista
                              children: List.generate(
                                  homeController.opcoes.length, (index) {
                                return addItemActionListener(
                                    context,
                                    homeController,
                                    homeController.opcoes[index].titulo,
                                    () => Modular.to.pushNamed("/"+
                                            homeController.opcoes[index].rota!,
                                            arguments: true)
                                        .then((value) {}),
                                    Icon(
                                      homeController.opcoes[index].icon,
                                      color: Colors.black54,
                                      size: 36,
                                    ));
                              }),
                            ),
                          ),
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
