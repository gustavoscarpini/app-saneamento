import 'package:appcontribuinte/components/button_widget.dart';
import 'package:appcontribuinte/components/carregando.dart';
import 'package:appcontribuinte/components/custom_alert.dart';
import 'package:appcontribuinte/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'imovel_controller.dart';
import 'imovel_module.dart';

class ImovelPage extends StatefulWidget {
  @override
  _ImovelPageState createState() => _ImovelPageState();
}

class _ImovelPageState extends State<ImovelPage> with Disposable {
  var imovelController = ImovelModule.to.get<ImovelController>();

  @override
  void initState() {
    super.initState();
    imovelController.carregar();
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: secundaryColor,
        title: Text("Imóveis",
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
              child: imovelController.isLoading
                  ? Carregando(
                      inverter: true,
                    )
                  : imovelController.imoveis.length == 0
                      ? Center(
                          child: Text("Nenhum imóvel vinculado ao seu CPF/CNPJ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500)),
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          padding: new EdgeInsets.only(
                              top: 10, right: 10.0, left: 10.0),
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 1,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30.0,
                                        left: 20,
                                        right: 20,
                                        bottom: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5, top: 5),
                                            child: Text(
                                              "Inscrição",
                                              style: GoogleFonts.raleway(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(
                                              "${imovelController.imoveis[index].inscricao}",
                                              style: GoogleFonts.raleway(
                                                  fontSize: 16,
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
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${imovelController.imoveis[index].setor}",
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
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${imovelController.imoveis[index].quadra}",
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
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${imovelController.imoveis[index].lote}",
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
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${imovelController.imoveis[index].areaTerreno}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 16,
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Bairro',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${imovelController.imoveis[index].bairro}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Logradouro',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${imovelController.imoveis[index].lograouro}",
                                                style: GoogleFonts.raleway(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
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
                                                  Text('Número',
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${imovelController.imoveis[index].numero}",
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
                                                  Text('Complemento',
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${imovelController.imoveis[index].complemento}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 16,
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Visibility(
                                          visible: imovelController
                                                      .imoveis[index]
                                                      .proprietarios !=
                                                  null &&
                                              imovelController.imoveis[index]
                                                  .proprietarios.isNotEmpty,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Container(
                                                alignment: Alignment.topCenter,
                                                child: ListView.separated(
                                                  itemCount: imovelController
                                                      .imoveis[index]
                                                      .proprietarios
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index2) {
                                                    return Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text('Proprietário',
                                                            style: GoogleFonts
                                                                .raleway()),
                                                        Text(
                                                          "${imovelController.imoveis[index].proprietarios[index2]}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .raleway(
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
                                        Visibility(
                                          visible: imovelController
                                                      .imoveis[index]
                                                      .construcoes !=
                                                  null &&
                                              imovelController.imoveis[index]
                                                  .construcoes.isNotEmpty,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Container(
                                                alignment: Alignment.topCenter,
                                                child: ListView.separated(
                                                  itemCount: imovelController
                                                      .imoveis[index]
                                                      .construcoes
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index2) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                "${imovelController.imoveis[index].construcoes[index2].descricao}",
                                                                style: GoogleFonts.raleway(
                                                                    fontSize:
                                                                        16,
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
                                                                "${imovelController.imoveis[index].construcoes[index2].area}",
                                                                style: GoogleFonts.raleway(
                                                                    fontSize:
                                                                        16,
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
                                          height: 20,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              imovelController.imprimir(
                                                  imovelController
                                                      .imoveis[index].id);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Imprimir",
                                                  style: GoogleFonts.raleway(
                                                      fontSize: 16, color: Colors.black54),
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
                            itemCount: imovelController.imoveis.length,
                            staggeredTileBuilder: (int index) {
                              return StaggeredTile.fit(1);
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
