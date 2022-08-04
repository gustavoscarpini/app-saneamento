import 'package:appcontribuinte/components/carregando.dart';
import 'package:appcontribuinte/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'itbi_controller.dart';

class ItbiPage extends StatefulWidget {
  @override
  _ItbiPageState createState() => _ItbiPageState();
}

class _ItbiPageState extends State<ItbiPage> with Disposable {
  var itbiController = Modular.get<ItbiController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final dateFormatter = new DateFormat("yyyy-MM-dd");
  final localDateFormatter = new DateFormat("dd/MM/yyyy");

  ScrollController _scrollController = new ScrollController();

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        itbiController.page = itbiController.itbis.length + 1;
        itbiController.carregar();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    new Future.delayed(Duration.zero, () {
      setState(() {
        itbiController.init();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: secundaryColor,
        title: Text("ITBI",
            style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w500)),
      ),
      body: Observer(
        builder: (_) {
          return SafeArea(
            child: Container(
              color: Color(0xFFE0E0E0),
              child: Container(
                alignment: Alignment.topCenter,
                padding: new EdgeInsets.only(top: 10, right: 10.0, left: 10.0),
                child: itbiController.itbis.isEmpty
                    ? itbiController.isLoading
                        ? Carregando(
                            inverter: true,
                          )
                        : Center(
                            child: Text("Nenhum ITBI vinculado ao seu CPF/CNPJ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                    color: Colors.black54,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500)),
                          )
                    : MasonryGridView.count(
                        crossAxisCount: 1,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        itemCount: itbiController.itbis.length,
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, left: 20, right: 20, bottom: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 5, top: 5),
                                        child: Text(
                                          "Itbi",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.raleway(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "${itbiController.itbis[index].numero}/${itbiController.itbis[index].ano}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.raleway(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Setor',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${itbiController.itbis[index].imovel!.setor}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Quadra',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${itbiController.itbis[index].imovel!.quadra}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Lote',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${itbiController.itbis[index].imovel!.lote}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Área',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${itbiController.itbis[index].imovel!.areaTerreno}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Logradouro',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${itbiController.itbis[index].imovel!.lograouro} ${itbiController.itbis[index].imovel!.numero != null ? ', nº' + itbiController.itbis[index].imovel!.numero! : ''} ",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Bairro',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${itbiController.itbis[index].imovel!.bairro}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Visibility(
                                      visible: itbiController.itbis[index]
                                                  .imovel!.construcoes !=
                                              null &&
                                          itbiController.itbis[index].imovel!
                                              .construcoes!.isNotEmpty,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                            alignment: Alignment.topCenter,
                                            child: ListView.separated(
                                              itemCount: itbiController
                                                  .itbis[index]
                                                  .imovel!
                                                  .construcoes!
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index2) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text('Construção',
                                                              style: GoogleFonts
                                                                  .raleway()),
                                                          Text(
                                                            "${itbiController.itbis[index].imovel!.construcoes![index2].descricao}",
                                                            style: GoogleFonts.raleway(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
                                                          Text(
                                                              'Área Construída',
                                                              style: GoogleFonts
                                                                  .raleway()),
                                                          Text(
                                                            "${itbiController.itbis[index].imovel!.construcoes![index2].area}",
                                                            style: GoogleFonts.raleway(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Divider(
                                                  height: 1,
                                                );
                                              },
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Visibility(
                                      visible: itbiController
                                                  .itbis[index].transmitentes !=
                                              null &&
                                          itbiController.itbis[index]
                                              .transmitentes!.isNotEmpty,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                            alignment: Alignment.topCenter,
                                            child: ListView.separated(
                                              itemCount: itbiController
                                                  .itbis[index]
                                                  .transmitentes!
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index2) {
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('Transmitente',
                                                        style: GoogleFonts
                                                            .raleway()),
                                                    Text(
                                                      "${itbiController.itbis[index].transmitentes![index2].nome}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black54,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Divider(
                                                  height: 1,
                                                );
                                              },
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Visibility(
                                      visible: itbiController
                                                  .itbis[index].adquirentes !=
                                              null &&
                                          itbiController.itbis[index]
                                              .adquirentes!.isNotEmpty,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                            alignment: Alignment.topCenter,
                                            child: ListView.separated(
                                              itemCount: itbiController
                                                  .itbis[index]
                                                  .adquirentes!
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index2) {
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('Adquirentes',
                                                        style: GoogleFonts
                                                            .raleway()),
                                                    Text(
                                                      "${itbiController.itbis[index].adquirentes![index2].nome}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black54,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ],
                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Divider(
                                                  height: 1,
                                                );
                                              },
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          itbiController.imprimir(
                                              itbiController.itbis[index]);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "Imprimir",
                                              style: GoogleFonts.raleway(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.black54,
                                              size: 20,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
