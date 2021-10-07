import 'package:appcontribuinte/domains/usuario.dart';
import 'package:appcontribuinte/login/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'perfil_repository.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  final PerfilRepository repo;
  final LoginRepository loginRepo;
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final repearPasswordController = TextEditingController();

  _PerfilControllerBase(
    this.repo,
    this.loginRepo,
  );

  @observable
  String mensagemTrocaSenha = "";

  @observable
  bool isLoading = false;

  @observable
  Usuario user;

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    isLoading = false;
  }

  @action
  Future trocarSenha() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    var usuario;
    try {
      usuario =
          await loginRepo.login(user.pessoa.cpfCnpj, passwordController.text);
    } finally {
      if (usuario == null) {
        mensagemTrocaSenha = "O campo Senha Atual não confere";
        isLoading = false;
        return Future.value(0);
      }
    }
    if (newPasswordController.text != repearPasswordController.text) {
      mensagemTrocaSenha =
          "Os campos Nova Senha e Repita a Nova Senha devem ser iguais";
      isLoading = false;
      return Future.value(0);
    }
    var trocarSenha =
        repo.trocarSenha(user.pessoa.cpfCnpj, newPasswordController.text);
    mensagemTrocaSenha = "Senha Alterada com sucesso";
    isLoading = false;
    return trocarSenha;
  }
}
