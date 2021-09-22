import 'package:appcontribuinte/domains/register.dart';
import 'package:appcontribuinte/domains/util.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'cadastro_usuario_repository.dart';

part 'cadastro_usuario_controller.g.dart';

class CadastroUsuarioController = _CadastroUsuarioControllerBase
    with _$CadastroUsuarioController;

abstract class _CadastroUsuarioControllerBase with Store {
  final CadastroUsuarioRepository repo;

  @observable
  Register register;

  @observable
  bool carregando = false;

  final cpfController = TextEditingController();
  final nomeController = TextEditingController();
  final nomeMaeController = TextEditingController();
  final emailController = TextEditingController();
  final nascimentoController = TextEditingController();

  _CadastroUsuarioControllerBase(this.repo);

  @action
  Future consultarCpf() async {
    carregando = true;
    register = await repo.consultarCPF(cpfController.text);
    carregando = false;
  }

  @action
  bool validarUsuario() {
    if (register.id != null) {
      if (register.nome == null || register.nome.trim().toLowerCase() !=
          nomeController.text.trim().toLowerCase()) {
        print("Nome não bate");
        return false;
      }
      if (register.nomeMae == null || register.nomeMae.trim().toLowerCase() !=
          nomeMaeController.text.trim().toLowerCase()) {
        print("Nome da mãe não bate");
        return false;
      }
      if(register.nascimento == null){
        print("Nascimento não bate");
        return false;
      }
      var dataClient = Util.serverSideFormart
          .format(Util.clientSideformart.parse(nascimentoController.text));
      var dataServer = Util.serverSideFormart.format(register.nascimento);

      if (dataServer != dataClient) {
        print("Nascimento não bate ${register.nascimento} - ${dataClient}");
        return false;
      }
    } else {
      register.nascimento =
          Util.clientSideformart.parse(nascimentoController.text);
      register.nome = nomeController.text;
      register.nomeMae = nomeMaeController.text;
    }
    register.email = emailController.text;
    register.cpf = cpfController.text;
    return true;
  }

  @action
  Future<int> salvarCadastroUsuario() async {
    try {
      carregando = true;
      int response = await repo.salvarCadastroUsuario(register);
      carregando = false;
      return response;
    } catch (e) {
      print("Erro ao salvar o registro..: " + e.toString());
      carregando = false;
      return 0;
    }
  }

  @action
  bool isComplete() {
    return !Util.isNullEmptyOrFalse(nomeController.text) &&
        !Util.isNullEmptyOrFalse(cpfController.text);
  }

  @override
  void dispose() {
    register = null;
    cpfController.text = "";
    nomeController.text = "";
    nomeMaeController.text = "";
    emailController.text = "";
    nascimentoController.text = "";
  }
}
