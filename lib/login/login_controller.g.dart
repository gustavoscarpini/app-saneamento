// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$hasUsernameComputed;

  @override
  bool get hasUsername =>
      (_$hasUsernameComputed ??= Computed<bool>(() => super.hasUsername,
              name: '_LoginControllerBase.hasUsername'))
          .value;

  final _$userNameAtom = Atom(name: '_LoginControllerBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_LoginControllerBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$biometriaAtom = Atom(name: '_LoginControllerBase.biometria');

  @override
  bool get biometria {
    _$biometriaAtom.reportRead();
    return super.biometria;
  }

  @override
  set biometria(bool value) {
    _$biometriaAtom.reportWrite(value, super.biometria, () {
      super.biometria = value;
    });
  }

  final _$loginSenhaSalvaAsyncAction =
      AsyncAction('_LoginControllerBase.loginSenhaSalva');

  @override
  Future<bool> loginSenhaSalva() {
    return _$loginSenhaSalvaAsyncAction.run(() => super.loginSenhaSalva());
  }

  final _$requestResetAsyncAction =
      AsyncAction('_LoginControllerBase.requestReset');

  @override
  Future<Usuario> requestReset(String login) {
    return _$requestResetAsyncAction.run(() => super.requestReset(login));
  }

  final _$resetPassordInitAsyncAction =
      AsyncAction('_LoginControllerBase.resetPassordInit');

  @override
  Future<dynamic> resetPassordInit(String cpf) {
    return _$resetPassordInitAsyncAction.run(() => super.resetPassordInit(cpf));
  }

  final _$redefinirSenhaAsyncAction =
      AsyncAction('_LoginControllerBase.redefinirSenha');

  @override
  Future<dynamic> redefinirSenha() {
    return _$redefinirSenhaAsyncAction.run(() => super.redefinirSenha());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void zerarUsuario() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.zerarUsuario');
    try {
      return super.zerarUsuario();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void usarBiometria(bool bio) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.usarBiometria');
    try {
      return super.usarBiometria(bio);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
carregando: ${carregando},
biometria: ${biometria},
hasUsername: ${hasUsername}
    ''';
  }
}
