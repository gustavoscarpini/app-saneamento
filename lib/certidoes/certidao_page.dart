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

import 'certidao_controller.dart';
import 'certidao_module.dart';

class CertidaoPage extends StatefulWidget {
  @override
  _CertidaoPageState createState() => _CertidaoPageState();
}

class _CertidaoPageState extends State<CertidaoPage> with Disposable {
  var certidaoController = CertidaoModule.to.get<CertidaoController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final dateFormatter = new DateFormat("yyyy-MM-dd");
  final localDateFormatter = new DateFormat("dd/MM/yyyy");

  ScrollController _scrollController = new ScrollController();

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        certidaoController.page = certidaoController.certidaos.length + 1;
        certidaoController.carregar();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    new Future.delayed(Duration.zero, () {
      setState(() {
        certidaoController.init();
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
        title: Text("Certidões",
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
                child: certidaoController.certidaos.isEmpty
                    ? certidaoController.isLoading
                        ? Carregando(
                            inverter: true,
                          )
                        : Center(
                            child: Text(
                                "Nenhuma certidao vinculada ao seu CPF/CNPJ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                    color: Colors.black54,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500)),
                          )
                    : StaggeredGridView.countBuilder(
                        crossAxisCount: 1,
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                        itemCount: certidaoController.certidaos.length,
                        controller: _scrollController,
                        staggeredTileBuilder: (int index) {
                          return StaggeredTile.fit(1);
                        },
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
                                          "Certidao",
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
                                          "${certidaoController.certidaos[index].tipoDocumento}",
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
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "${certidaoController.certidaos[index].vencida ? 'Vencida em' : 'Vencimento em'} ${localDateFormatter.format(dateFormatter.parse(certidaoController.certidaos[index].validade))}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.raleway(
                                              fontSize: 14,
                                              color: certidaoController
                                                      .certidaos[index].vencida
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
                                              Text('Situação',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${certidaoController.certidaos[index].situacao}",
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
                                              Text('Emissão',
                                                  style: GoogleFonts.raleway()),
                                              Text(
                                                "${localDateFormatter.format(dateFormatter.parse(certidaoController.certidaos[index].dataSolicitacao))}",
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
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "${certidaoController.certidaos[index].tipoCadastro}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.raleway(
                                              fontSize: 14,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          "${certidaoController.certidaos[index].cadastro}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.raleway(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
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
                                          certidaoController.imprimir(
                                              certidaoController
                                                  .certidaos[index]);
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
                    itemCount: certidaoController.alvaras.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${certidaoController.alvaras[index].ano}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${certidaoController.alvaras[index].tipo}",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${certidaoController.alvaras[index].emissao}",
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
