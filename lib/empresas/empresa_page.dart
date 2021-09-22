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

import 'empresa_controller.dart';
import 'empresa_module.dart';

class EmpresaPage extends StatefulWidget {
  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> with Disposable {
  var empresaController = EmpresaModule.to.get<EmpresaController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    empresaController.carregar();
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
        title: Text("Empresas",
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
              child: empresaController.isLoading
                  ? Carregando(
                      inverter: true,
                    )
                  : empresaController.empresas.length == 0
                      ? Center(
                          child: Text(
                              "Nenhuma empresa vinculada ao seu CPF/CNPJ",
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
                                            "Inscrição",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "${empresaController.empresas[index].cmc}",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text('Nome/Razão Social ',
                                              style: GoogleFonts.raleway()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Text(
                                            "${empresaController.empresas[index].pessoa}",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text('CPF/CNPJ',
                                              style: GoogleFonts.raleway()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Text(
                                            "${empresaController.empresas[index].cpfCnpj}",
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text('Sócios',
                                              style: GoogleFonts.raleway()),
                                        ),
                                        Visibility(
                                          visible: empresaController
                                                      .empresas[index].socios !=
                                                  null &&
                                              empresaController.empresas[index]
                                                  .socios.isNotEmpty,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: ListView.separated(
                                                  itemCount: empresaController
                                                      .empresas[index]
                                                      .socios
                                                      .length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index2) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(
                                                          "${empresaController.empresas[index].socios[index2].socio}",
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
                                                        Text(
                                                          "${empresaController.empresas[index].socios[index2].proporcao} %",
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
                                        SizedBox(height: 10,),
                                        Divider(height: 5),
                                        Visibility(
                                          visible: empresaController
                                              .empresas[index].alvaras !=
                                              null &&
                                              empresaController.empresas[index]
                                                  .alvaras.isNotEmpty,
                                          child: ListView.separated(
                                            itemCount:  empresaController
                                                .empresas[index]
                                                .alvaras == null ? 0: empresaController
                                                .empresas[index]
                                                .alvaras
                                                .length,
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (context, index2) {
                                              return  TextButton(
                                                  onPressed: () {
                                                    empresaController.imprimirAlvara(empresaController
                                                        .empresas[index]
                                                        .alvaras[index2].id);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        "${empresaController
                                                            .empresas[index]
                                                            .alvaras[index2].ano} - ${empresaController
                                                            .empresas[index]
                                                            .alvaras[index2].tipo}",
                                                        style: GoogleFonts.raleway(
                                                            fontSize: 16, color: Colors.black54),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color: Colors.black54,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ));
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                int index) {
                                              return Divider(
                                                height: 5,
                                              );
                                            },
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              empresaController.imprimirCadastro(
                                                  empresaController
                                                      .empresas[index].cmc);
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
                            itemCount: empresaController.empresas.length,
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
                    itemCount: empresaController.alvaras.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${empresaController.alvaras[index].ano}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${empresaController.alvaras[index].tipo}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${empresaController.alvaras[index].emissao}",
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
