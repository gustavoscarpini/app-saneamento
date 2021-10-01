import 'package:appcontribuinte/domains/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'login_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase extends Disposable with Store {
  final LoginRepository repo;
  SharedPreferences prefs;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  String userName = "";

  @observable
  bool carregando = false;

  @observable
  bool biometria = false;

  Usuario usuario = Usuario();

  @computed
  bool get hasUsername => userName != null && userName.isNotEmpty;

  _LoginControllerBase(this.repo) {
    carregarDadosSessao();
  }

  void carregarDadosSessao() async {
    prefs = await SharedPreferences.getInstance();
    String cpf = prefs.getString(KEY_USERLOGIN);
    if (cpf != null && cpf.isNotEmpty) {
      loginController.text = cpf;
    }
    String bio = prefs.getString(KEY_BIOMETRIA);
    if (bio != null && bio.isNotEmpty) {
      biometria = bio.toLowerCase() == 'true';
    }
    userName = prefs.getString(KEY_USERNAME);
  }

  @action
  void zerarUsuario() {
    prefs.setString(KEY_USERLOGIN, null);
    prefs.setString(KEY_USERNAME, null);
    prefs.setString(KEY_BIOMETRIA, null);
    userName = "";
    loginController.text = "";
    biometria = false;
  }

  @action
  Future<bool> loginSenhaSalva() async {
    passwordController.text = prefs.getString(KEY_PASSWORD);
    return login();
  }

  @action
  void usarBiometria(bool bio) {
    biometria = bio;
    prefs.setString(KEY_BIOMETRIA, biometria.toString());
  }

  Future<bool> login() async {
    try {
      carregando = true;
      usuario = await repo.login(loginController.text, passwordController.text);
      prefs.setString(KEY_USERLOGIN, loginController.text);
      prefs.setString(KEY_USERNAME, usuario.pessoa.nome.split(" ")[0]);
      prefs.setString(KEY_PASSWORD, passwordController.text);
      carregando = false;
      return usuario?.token != null;
    } catch (e) {
      usuario = null;
      print(e);
      carregando = false;
      return false;
    }
  }

  @action
  Future<Usuario> requestReset(String login) async {
    carregando = true;
    // Usuario user = await repo.fromLogin(login);
    carregando = false;
    // return user;
  }

  @action
  Future resetPassordInit(String cpf) async {
    carregando = true;
    var future = await repo.resetPassordInit(cpf);
    carregando = false;
    return future;
  }

  @action
  Future redefinirSenha() async {
    carregando = true;
    var future = await repo.redefinirSenha(loginController.text);
    carregando = false;
    return future;
  }

  @override
  void dispose() {
    usuario = null;
    carregando = false;
  }
}
