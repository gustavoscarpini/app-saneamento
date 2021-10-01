import 'dart:core';

import 'package:appcontribuinte/components/carregando.dart';
import 'package:appcontribuinte/components/custom_alert.dart';
import 'package:appcontribuinte/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_controller.dart';
import 'login_module.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controller = LoginModule.to.get<LoginController>();

  Controller _controller;
  bool showPassword = false;

  @override
  void didChangeDependencies() {
    _controller = Controller();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Observer(builder: (_) {
          return Container(
            padding: EdgeInsets.only(top: 30, left: 40, right: 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFD9DADA), Color(0xFFA7A7A7)],
                  stops: [0.3, 1]),
            ),
            child: Form(
              key: _controller.formKey,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 120,
                            child: Image.asset("assets/logo-servicos.png"),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                            child: Text(
                          "Serviços On-line",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        Center(
                            child: Text("Município de Rio Branco",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                )))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Container(
                          height: 250,
                          padding: EdgeInsets.only(
                              top: 10, left: 30, right: 30, bottom: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ListView(
                            children: <Widget>[
                              controller.hasUsername
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        "Olá, ${controller.userName}",
                                        style: GoogleFonts.raleway(
                                          fontSize: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  : TextFormField(
                                      controller: controller.loginController,
                                      validator: (value) => value.isEmpty
                                          ? "O Login não pode ser nulo"
                                          : null,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          labelText: "CPF ou CNPJ",
                                          labelStyle: GoogleFonts.raleway(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ),
                              TextFormField(
                                enabled: !controller.biometria,
                                controller: controller.passwordController,
                                validator: (value) => value.isEmpty
                                    ? "A senha não pode ser nulo"
                                    : null,
                                keyboardType: TextInputType.text,
                                obscureText: !showPassword,
                                decoration: InputDecoration(
                                    labelText: "Senha",
                                    suffixIcon: IconButton(
                                      icon: Icon(showPassword ? Icons.remove_red_eye_outlined :Icons.remove_red_eye),
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                    ),
                                    labelStyle: GoogleFonts.raleway(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16)),
                              ),
                              controller.hasUsername
                                  ? Container(
                                      height: 40,
                                      alignment: Alignment.bottomRight,
                                      child: FlatButton(
                                          onPressed: () {
                                            controller.zerarUsuario();
                                          },
                                          child: Text(
                                            "Entrar com outra conta",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          )),
                                    )
                                  : Container(
                                      height: 40,
                                      alignment: Alignment.bottomRight,
                                      child: FlatButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, "register");
                                          },
                                          child: Text(
                                            "Cadastrar-se",
                                            style: TextStyle(
                                                color: Colors.black45),
                                          )),
                                    ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  top: 220.0, left: 30, right: 30),
                              height: 60,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Color(0xFF1C84C6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: controller.carregando
                                  ? Carregando()
                                  : SizedBox.expand(
                                      child: FlatButton(
                                          onPressed: () async {
                                            controller.login().then((value) {
                                              if (value) {
                                                Navigator.pushReplacementNamed(
                                                    context, "home");
                                              } else {
                                                CustomAlert.show(context,
                                                    title:
                                                        "Operação não realizada",
                                                    subTitle:
                                                        "Verifique o seu usuário e senha, não foi possível realizar o login com essas informações",
                                                    style: AlertStyle.error);
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Acessar",
                                                style: GoogleFonts.raleway(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                textAlign: TextAlign.left,
                                              ),
                                              Container(
                                                child: SizedBox(
                                                  child: !controller.biometria
                                                      ? Icon(
                                                          Icons.lock_open,
                                                          color: Colors.white,
                                                        )
                                                      : Icon(
                                                          Icons.fingerprint,
                                                          color: Colors.white,
                                                        ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                            ),
                            Visibility(
                              visible: controller
                                      .passwordController.text.isEmpty &&
                                  !controller.loginController.text.isEmpty &&
                                  controller.hasUsername != null,
                              child: Container(
                                height: 30,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Biometria",
                                    ),
                                    Switch(
                                      activeTrackColor: Colors.blueGrey,
                                      activeColor: Color(0xFF26A69A),
                                      value: controller.biometria,
                                      onChanged: (bool value) {
                                        setState(() {
                                          controller.usarBiometria(value);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              MaterialButton(
                                minWidth: 40,
                                onPressed: () {
                                  _openEsqueciSenhaModal(
                                      context, controller, _controller);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.lock, color: Colors.black54),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Esqueci a senha',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                minWidth: 40,
                                onPressed: () {
                                  Navigator.pushNamed(context, "register");
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.person_add_alt,
                                        color: Colors.black54),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        'Primeiro Acesso',
                                        style: GoogleFonts.raleway(
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          // }
        }));
  }
}

class Controller {
  var formKey = GlobalKey<FormState>();

  bool validate() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }
}

_openEsqueciSenhaModal(
    context, LoginController controller, Controller _controller) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Observer(builder: (_) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            padding: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "Esqueceu a senha?",
                    style: GoogleFonts.raleway(fontSize: 24),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.loginController,
                  validator: (value) =>
                      value.isEmpty ? "O login não pode ser nulo" : null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Digite o CPF ou CNPJ",
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
                  child: controller.carregando
                      ? Carregando()
                      : SizedBox.expand(
                          child: TextButton(
                              onPressed: () async {
                                controller.redefinirSenha().then((value) {
                                  CustomAlert.show(context, onConfirm: () {
                                    Navigator.of(context)
                                        .pushNamed("login", arguments: true)
                                        .then((value) {});
                                  },
                                      title: "Operação realizada",
                                      subTitle: "${value}",
                                      style: AlertStyle.success);
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
                                    child: Icon(
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
