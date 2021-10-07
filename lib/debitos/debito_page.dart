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

import 'debito_controller.dart';
import 'debito_module.dart';

class DebitoPage extends StatefulWidget {
  @override
  _DebitoPageState createState() => _DebitoPageState();
}

class _DebitoPageState extends State<DebitoPage> with Disposable {
  var debitoController = DebitoModule.to.get<DebitoController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formatter = new NumberFormat("#,##0.00", "pt_BR");

  @override
  void initState() {
    super.initState();
    debitoController.carregar();
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
        title: Text("Debitos",
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
              child: debitoController.isLoading
                  ? Carregando(
                      inverter: true,
                    )
                  : debitoController.debitos.length == 0
                      ? Center(
                          child: Text(
                              "Nenhuma debito vinculada ao seu CPF/CNPJ",
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
                                              "Debito",
                                              textAlign: TextAlign.center,
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
                                              "${debitoController.debitos[index].divida}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.raleway(
                                                  fontSize: 14,
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(
                                              "Vencimento em ${debitoController.debitos[index].vencimentoToString}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.raleway(
                                                  fontSize: 14,
                                                  color: debitoController
                                                          .debitos[index]
                                                          .vencido
                                                      ? Colors.redAccent
                                                      : Colors.black54),
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
                                                  Text('Tipo',
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${debitoController.debitos[index].tipoDeDebito}",
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
                                                  Text('Exercício',
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${debitoController.debitos[index].exercicio}",
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
                                                  Text('Valor Total',
                                                      style: GoogleFonts
                                                          .raleway()),
                                                  Text(
                                                    "${formatter.format(debitoController.debitos[index].valorTotal)}",
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
                                        Divider(
                                          height: 10,
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
                                                  Text('Imposto',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 12)),
                                                  Text(
                                                    "${formatter.format(debitoController.debitos[index].valorImposto)}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 12,
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
                                                  Text('Taxa',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 12)),
                                                  Text(
                                                    "${formatter.format(debitoController.debitos[index].valorTaxa)}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 12,
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
                                                  Text('Juros',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 12)),
                                                  Text(
                                                    "${formatter.format(debitoController.debitos[index].valorJuros)}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 12,
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
                                                  Text('Multa',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 12)),
                                                  Text(
                                                    "${formatter.format(debitoController.debitos[index].valorMulta)}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 12,
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
                                                  Text('Correção',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 12)),
                                                  Text(
                                                    "${formatter.format(debitoController.debitos[index].valorCorrecao)}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 12,
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
                                                  Text('Honorários',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              fontSize: 12)),
                                                  Text(
                                                    "${formatter.format(debitoController.debitos[index].valorHonorarios)}",
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 12,
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
                                        Divider(
                                          height: 10,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              debitoController.imprimir(
                                                  debitoController
                                                      .debitos[index]);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Gerar guia",
                                                  style: GoogleFonts.raleway(
                                                      fontSize: 16,
                                                      color: Colors.black54),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
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
                            itemCount: debitoController.debitos.length,
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

  _openModalAlvara(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Observer(builder: (_) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              padding:
                  EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "Alvaras",
                      style: GoogleFonts.raleway(fontSize: 24),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    itemCount: debitoController.alvaras.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${debitoController.alvaras[index].ano}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${debitoController.alvaras[index].tipo}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${debitoController.alvaras[index].emissao}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 5,
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
