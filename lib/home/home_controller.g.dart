// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

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

  late final _$validouCodigoAtom =
      Atom(name: '_HomeControllerBase.validouCodigo', context: context);

  @override
  bool get validouCodigo {
    _$validouCodigoAtom.reportRead();
    return super.validouCodigo;
  }

  @override
  set validouCodigo(bool value) {
    _$validouCodigoAtom.reportWrite(value, super.validouCodigo, () {
      super.validouCodigo = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_HomeControllerBase.user', context: context);

  @override
  Usuario? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Usuario? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$solicitacaoDispositivoAtom = Atom(
      name: '_HomeControllerBase.solicitacaoDispositivo', context: context);

  @override
  SolicitacaoDispositivo? get solicitacaoDispositivo {
    _$solicitacaoDispositivoAtom.reportRead();
    return super.solicitacaoDispositivo;
  }

  @override
  set solicitacaoDispositivo(SolicitacaoDispositivo? value) {
    _$solicitacaoDispositivoAtom
        .reportWrite(value, super.solicitacaoDispositivo, () {
      super.solicitacaoDispositivo = value;
    });
  }

  late final _$carregarAsyncAction =
      AsyncAction('_HomeControllerBase.carregar', context: context);

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$solicitarAcessoAoDispositivoAsyncAction = AsyncAction(
      '_HomeControllerBase.solicitarAcessoAoDispositivo',
      context: context);

  @override
  Future<dynamic> solicitarAcessoAoDispositivo() {
    return _$solicitarAcessoAoDispositivoAsyncAction
        .run(() => super.solicitarAcessoAoDispositivo());
  }

  late final _$confirmarDispositivoAsyncAction =
      AsyncAction('_HomeControllerBase.confirmarDispositivo', context: context);

  @override
  Future<dynamic> confirmarDispositivo(String codigo) {
    return _$confirmarDispositivoAsyncAction
        .run(() => super.confirmarDispositivo(codigo));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
validouCodigo: ${validouCodigo},
user: ${user},
solicitacaoDispositivo: ${solicitacaoDispositivo}
    ''';
  }
}
