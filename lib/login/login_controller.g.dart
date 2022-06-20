// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool>? _$hasUsernameComputed;

  @override
  bool get hasUsername =>
      (_$hasUsernameComputed ??= Computed<bool>(() => super.hasUsername,
              name: '_LoginControllerBase.hasUsername'))
          .value;

  late final _$userNameAtom =
      Atom(name: '_LoginControllerBase.userName', context: context);

  @override
  String? get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String? value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$carregandoAtom =
      Atom(name: '_LoginControllerBase.carregando', context: context);

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

  late final _$biometriaAtom =
      Atom(name: '_LoginControllerBase.biometria', context: context);

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

  late final _$loginSenhaSalvaAsyncAction =
      AsyncAction('_LoginControllerBase.loginSenhaSalva', context: context);

  @override
  Future<bool> loginSenhaSalva() {
    return _$loginSenhaSalvaAsyncAction.run(() => super.loginSenhaSalva());
  }

  late final _$resetPassordInitAsyncAction =
      AsyncAction('_LoginControllerBase.resetPassordInit', context: context);

  @override
  Future<dynamic> resetPassordInit(String cpf) {
    return _$resetPassordInitAsyncAction.run(() => super.resetPassordInit(cpf));
  }

  late final _$redefinirSenhaAsyncAction =
      AsyncAction('_LoginControllerBase.redefinirSenha', context: context);

  @override
  Future<dynamic> redefinirSenha() {
    return _$redefinirSenhaAsyncAction.run(() => super.redefinirSenha());
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

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
