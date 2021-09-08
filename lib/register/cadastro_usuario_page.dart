import 'package:appcontribuinte/components/carregando.dart';
import 'package:appcontribuinte/components/cpf_cnpj_format.dart';
import 'package:appcontribuinte/components/custom_alert.dart';
import 'package:appcontribuinte/components/input_text.dart';
import 'package:appcontribuinte/domains/util.dart';
import 'package:appcontribuinte/register/cadastro_usuario_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cadastro_usuario_module.dart';

class CadastroUsuarioPage extends StatefulWidget {
  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  var _controllerUsuario =
      CadastroUsuarioModule.to.get<CadastroUsuarioController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerUsuario.dispose();
    super.dispose();
  }

  void _consultarCPF(cpf) {
    _controllerUsuario.consultarCpf().then((value) {
      setState(() {
        if (_controllerUsuario.register.id != null) {
          if (_controllerUsuario.register.usuario) {
            CustomAlert.show(context,
                title: "Atênção",
                subTitle:
                    "Já existe um usuário cadastrado com esse CPF, utilize o esqueci minha senha para recuperar o seu acesso",
                style: AlertStyle.warning);
          } else {
            CustomAlert.show(context,
                title: "Atênção",
                subTitle:
                    "O seu cadastrado já existe na base de dados da prefeitura, confirme algumas informações para continuar",
                style: AlertStyle.success);
          }
        } else {
          CustomAlert.show(context,
              title: "Atênção",
              subTitle:
                  "O seu cadastrado ainda não existe na base de dados da prefeitura, informe alguns dados para continuar",
              style: AlertStyle.success);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Solicitação de Acesso',
              style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                children: <Widget>[
                  InputText(
                    onSubmitted: _consultarCPF,
                    controller: _controllerUsuario.cpfController,
                    formatter: CpfCnpjFormatter(),
                    label: "CPF",
                    type: TextInputType.number,
                  ),
                  Observer(builder: (_) {
                    return _controllerUsuario.carregando
                        ? Carregando(
                            inverter: true,
                          )
                        : Container();
                  }),
                  Observer(builder: (_) {
                    return Visibility(
                        visible: _controllerUsuario.register != null &&
                            !_controllerUsuario.register.usuario,
                        child: Column(
                          children: [
                            InputText(
                              controller: _controllerUsuario.nomeController,
                              label: "Nome Completo",
                              type: TextInputType.text,
                            ),
                            InputText(
                              controller: _controllerUsuario.emailController,
                              label: "E-mail",
                              type: TextInputType.emailAddress,
                            ),
                            InputText(
                              controller:
                                  _controllerUsuario.nascimentoController,
                              label: "Data de Nascimento",
                              type: TextInputType.datetime,
                              onTap: () async {
                                DateTime date = DateTime(1900);
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());

                                date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));

                                _controllerUsuario.nascimentoController.text =
                                    Util.clientSideformart.format(date);
                              },
                            ),
                            InputText(
                              controller: _controllerUsuario.nomeMaeController,
                              label: "Nome da Mãe Completo",
                              type: TextInputType.datetime,
                            ),
                          ],
                        ));
                  })
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: new Visibility(
          visible: _controllerUsuario.register != null &&
              !_controllerUsuario.register.usuario,
          child: Observer(
            builder: (_) {
              return FloatingActionButton(
                onPressed: () async {
                  if (_controllerUsuario.isComplete()) {
                    if (_controllerUsuario.validarUsuario()) {
                      _controllerUsuario.salvarCadastroUsuario().then((value) {
                        if (value == 200) {
                          CustomAlert.show(context,
                              onConfirm: () {
                                Navigator.of(context)
                                    .pushNamed("login", arguments: true)
                                    .then((value) {});
                              },
                              title: "Cadastro realizado",
                              subTitle:
                                  "Foi enviado para o seu email a senha temporária para acesso.",
                              style: AlertStyle.success);
                        } else {
                          CustomAlert.show(context,
                              title: "Cadastro não realizado",
                              subTitle:
                                  "Não foi possível completar a operação.",
                              style: AlertStyle.error);
                        }
                      });
                    } else {
                      CustomAlert.show(context,
                          title: "Atênção",
                          subTitle:
                              "Os dados não conferem com o seu cadastro. Dirija-se a um Centro de Atendimento ao Cidadão (CAC).",
                          style: AlertStyle.warning);
                    }
                  } else {
                    CustomAlert.show(context,
                        title: "Atênção",
                        subTitle: "Para continuar informe todos os campos",
                        style: AlertStyle.warning);
                  }
                },
                tooltip: 'Salvar',
                child: _controllerUsuario.carregando
                    ? Carregando()
                    : Icon(Icons.arrow_forward_outlined),
              );
            },
          ),
        ),
      ),
    );
  }
}
