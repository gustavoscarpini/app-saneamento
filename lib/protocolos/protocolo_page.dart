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

import 'protocolo_controller.dart';
import 'protocolo_module.dart';

class ProtocoloPage extends StatefulWidget {
  @override
  _ProtocoloPageState createState() => _ProtocoloPageState();
}

class _ProtocoloPageState extends State<ProtocoloPage> with Disposable {
  var protocoloController = ProtocoloModule.to.get<ProtocoloController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    protocoloController.carregar();
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
        title: Text("Protocolos",
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
              child: protocoloController.isLoading
                  ? Carregando(
                      inverter: true,
                    )
                  : protocoloController.protocolos.length == 0
                      ? Center(
                          child: Text(
                              "Nenhuma protocolo vinculada ao seu CPF/CNPJ",
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Text(
                                            "Protocolo",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "${protocoloController.protocolos[index].numero}/${protocoloController.protocolos[index].ano} (${protocoloController.protocolos[index].situacao})",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Text(
                                            "Responsável",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "${protocoloController.protocolos[index].responsavel}",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Text(
                                            "Cadastrado por",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "${protocoloController.protocolos[index].cadastradoPor}",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Text(
                                            "Assunto",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "${protocoloController.protocolos[index].assunto}",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Divider(height: 5,),

                                        Visibility(
                                          visible: protocoloController
                                                      .protocolos[index]
                                                      .tramites !=
                                                  null &&
                                              protocoloController
                                                  .protocolos[index]
                                                  .tramites
                                                  .isNotEmpty,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: ListView.separated(
                                                  itemCount: protocoloController
                                                      .protocolos[index]
                                                      .tramites
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index2) {
                                                    return Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.only(top: 5),
                                                          child: Text('${protocoloController.protocolos[index].tramites[index2].indice +1}º Trâmite',
                                                              style: GoogleFonts.raleway()),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text('Origem',
                                                              style: GoogleFonts
                                                                  .raleway()),
                                                        ),
                                                        Text(
                                                          "${protocoloController.protocolos[index].tramites[index2].origem}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(
                                                              'Encaminhado / Arquivado',
                                                              style: GoogleFonts
                                                                  .raleway()),
                                                        ),
                                                        Text(
                                                          "${protocoloController.protocolos[index].tramites[index2].conclusao == null?
                                                              '':
                                                              protocoloController.protocolos[index].tramites[index2].conclusao}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text('Destino',
                                                              style: GoogleFonts
                                                                  .raleway()),
                                                        ),
                                                        Text(
                                                          "${protocoloController.protocolos[index].tramites[index2].destino == null?
                                                              '':
                                                              protocoloController.protocolos[index].tramites[index2].destino}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text('Aceite',
                                                              style: GoogleFonts
                                                                  .raleway()),
                                                        ),
                                                        Text(
                                                          "${protocoloController.protocolos[index].tramites[index2].aceite ==null ?
                                                          '':protocoloController.protocolos[index].tramites[index2].aceite}",
                                                          textAlign:
                                                              TextAlign.left,
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
                                        Divider(height: 5,),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text('Documentos',
                                              style: GoogleFonts.raleway()),
                                        ),
                                        Visibility(
                                          visible: protocoloController
                                                      .protocolos[index]
                                                      .documentos !=
                                                  null &&
                                              protocoloController
                                                  .protocolos[index]
                                                  .documentos
                                                  .isNotEmpty,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: ListView.separated(
                                                  itemCount: protocoloController
                                                      .protocolos[index]
                                                      .documentos
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index2) {
                                                    return Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text('Nome',
                                                              style: GoogleFonts
                                                                  .raleway()),
                                                        ),
                                                        Text(
                                                          "${protocoloController.protocolos[index].documentos[index2].nome}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Text(
                                                              'Número',
                                                              style: GoogleFonts
                                                                  .raleway()),
                                                        ),
                                                        Text(
                                                          "${protocoloController.protocolos[index].documentos[index2].numero}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: GoogleFonts
                                                              .raleway(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
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
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: protocoloController.protocolos.length,
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
                    itemCount: protocoloController.alvaras.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${protocoloController.alvaras[index].ano}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${protocoloController.alvaras[index].tipo}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${protocoloController.alvaras[index].emissao}",
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
