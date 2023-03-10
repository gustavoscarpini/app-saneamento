import 'package:appcontribuinte/components/button_widget.dart';
import 'package:appcontribuinte/components/carregando.dart';
import 'package:appcontribuinte/components/custom_alert.dart';
import 'package:appcontribuinte/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'perfil_controller.dart';
import 'perfil_module.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> with Disposable {
  var perfilController = Modular.get<PerfilController>();

  @override
  void initState() {
    super.initState();
    perfilController.carregar();
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
        title: Text("Perfil",
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
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: perfilController.user != null &&
                                    perfilController.user!.pessoa != null &&
                                    perfilController.user!.pessoa!.foto !=
                                        null &&
                                    perfilController.user!.pessoa!.foto!.file !=
                                        null
                                    ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    perfilController.user!.pessoa!.foto!.file!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius:
                                      BorderRadius.circular(50)),
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
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 10),
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: AutoSizeText(
                                    "${perfilController.user!.pessoa!.nome}",
                                    maxLines: 1,
                                    style: GoogleFonts.raleway(
                                        color: Colors.black87,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Center(
                                  child: AutoSizeText(
                                    "${perfilController.user!.pessoa!.email}",
                                    maxLines: 1,
                                    style: GoogleFonts.raleway(
                                        color: Colors.black54, fontSize: 16.0),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text('CPF', style: GoogleFonts.raleway()),
                                    Text(
                                      "${perfilController.user!.pessoa!.cpfCnpj}",
                                      style: GoogleFonts.raleway(
                                          fontSize: 16, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text('RG', style: GoogleFonts.raleway()),
                                    Text(
                                      "${perfilController.user!.pessoa!.rgInscricao}",
                                      style: GoogleFonts.raleway(
                                          fontSize: 16, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],),
                        Column(
                          children: [
                            ButtonWidget(
                              onPressed: () {
                                _openTrocarSenha(context);
                              },
                              text: "ALTERAR SENHA",
                              color: primaryColor,
                            ),
                            SizedBox(height: 20),
                            ButtonWidget(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, "/login");
                              },
                              text: "SAIR DA CONTA",
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }

  _openTrocarSenha(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Observer(builder: (_) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              padding:
                  EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      "Trocar Senha",
                      style: GoogleFonts.raleway(fontSize: 24),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: perfilController.passwordController,
                    validator: (value) =>
                        value!.isEmpty ? "A senha n??o pode ser nulo" : null,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: GoogleFonts.raleway(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: perfilController.newPasswordController,
                    validator: (value) =>
                        value!.isEmpty ? "A nova senha n??o pode ser nulo" : null,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Senha",
                       labelStyle: GoogleFonts.raleway(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: perfilController.passwordController,
                    validator: (value) => value!.isEmpty
                        ? "A senha repetida n??o pode ser nulo"
                        : null,
                    keyboardType: TextInputType.text,
                    obscureText:true,
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: GoogleFonts.raleway(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    height: 50,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SizedBox.expand(
                      child: TextButton(
                          onPressed: () async {
                            perfilController.trocarSenha().then((value) {
                              print(value);
                              CustomAlert.show(context, onConfirm: () {
                                if (value != 0) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              },
                                  isDismissible: false,
                                  title: value != 0
                                      ? "Opera????o realizada"
                                      : "Opera????o n??o realizada",
                                  subTitle:
                                      "${perfilController.mensagemTrocaSenha}",
                                  style: value != 0
                                      ? AlertStyle.success
                                      : AlertStyle.warning);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Continuar",
                                  style: GoogleFonts.raleway(
                                      color: Colors.white, fontSize: 22),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: perfilController.isLoading
                                    ? Carregando()
                                    : Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                              ),
                            ],
                          )),
                    ),
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
