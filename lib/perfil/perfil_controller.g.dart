// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$mensagemTrocaSenhaAtom =
      Atom(name: '_PerfilControllerBase.mensagemTrocaSenha');

  @override
  String get mensagemTrocaSenha {
    _$mensagemTrocaSenhaAtom.reportRead();
    return super.mensagemTrocaSenha;
  }

  @override
  set mensagemTrocaSenha(String value) {
    _$mensagemTrocaSenhaAtom.reportWrite(value, super.mensagemTrocaSenha, () {
      super.mensagemTrocaSenha = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PerfilControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$userAtom = Atom(name: '_PerfilControllerBase.user');

  @override
  Usuario get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Usuario value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$carregarAsyncAction = AsyncAction('_PerfilControllerBase.carregar');

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  final _$trocarSenhaAsyncAction =
      AsyncAction('_PerfilControllerBase.trocarSenha');

  @override
  Future<dynamic> trocarSenha() {
    return _$trocarSenhaAsyncAction.run(() => super.trocarSenha());
  }

  @override
  String toString() {
    return '''
mensagemTrocaSenha: ${mensagemTrocaSenha},
isLoading: ${isLoading},
user: ${user}
    ''';
  }
}
