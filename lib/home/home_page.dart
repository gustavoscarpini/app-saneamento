import 'dart:async';

import 'package:appcontribuinte/components/carregando.dart';
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
import 'home_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Disposable {
  var homeController = HomeModule.to.get<HomeController>();

  Timer _everySecond;

  @override
  void initState() {
    super.initState();
    homeController.carregar().then((value) {
      if (homeController.user != null) {
        setState(() {
          CustomAlert.show(context,
              title: "Olá ${homeController.user.pessoa.nome}",
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
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xffe8e8e8),
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          alignment: Alignment.bottomCenter,
          color: secundaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("configuracao");
                },
              ),
              Text("Portal do Contribuínte",
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 16.0,
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
                      Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColorContainer,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.3, 1],
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .4,
                              padding:
                                  EdgeInsets.only(top: 30, left: 20, right: 20),
                              child: homeController.user != null &&
                                      homeController.user.pessoa != null
                                  ? Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 55,
                                          backgroundColor: Color(0xFF2D9ABA),
                                          child: homeController.user != null &&
                                                  homeController.user.pessoa !=
                                                      null &&
                                                  homeController
                                                          .user.pessoa.foto !=
                                                      null &&
                                                  homeController.user.pessoa
                                                          .foto.file !=
                                                      null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Image.file(
                                                    homeController
                                                        .user.pessoa.foto.file,
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
                                        SizedBox(height: 10),
                                        Text(
                                          "${homeController.user.pessoa.nome}",
                                          style: GoogleFonts.raleway(
                                              color: Colors.white,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(height: 5),
                                        Observer(
                                          builder: (_) => AutoSizeText(
                                            "${homeController.user.pessoa.email}",
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Carregando())
                        ],
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: new EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .3,
                        right: 10.0,
                        left: 10.0),
                    child: GridView.count(
                      //cria um grid com 2 colunas
                      crossAxisCount: 3,
                      // Gera 100 Widgets que exibem o seu índice na lista
                      children:
                          List.generate(homeController.opcoes.length, (index) {
                        return addItemActionListener(
                            context,
                            homeController,
                            homeController.opcoes[index].titulo,
                            () => Navigator.of(context)
                                .pushNamed("consulta-veiculo", arguments: true)
                                .then((value) {}),
                            Icon(
                              homeController.opcoes[index].icon,
                              color: secundaryColor,
                              size: 36,
                            ));
                      }),
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
      elevation: 1.0,
      child: Card(
          color: Colors.white,
          elevation: 0,
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
                    style: GoogleFonts.raleway(color: secundaryColor),
                    textAlign: TextAlign.center,
                  )),
                ]),
          )),
    );
