// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certidao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CertidaoController on _CertidaoControllerBase, Store {
  final _$certidaosAtom = Atom(name: '_CertidaoControllerBase.certidaos');

  @override
  ObservableList<Certidao> get certidaos {
    _$certidaosAtom.reportRead();
    return super.certidaos;
  }

  @override
  set certidaos(ObservableList<Certidao> value) {
    _$certidaosAtom.reportWrite(value, super.certidaos, () {
      super.certidaos = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CertidaoControllerBase.isLoading');

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

  final _$iniciouAtom = Atom(name: '_CertidaoControllerBase.iniciou');

  @override
  bool get iniciou {
    _$iniciouAtom.reportRead();
    return super.iniciou;
  }

  @override
  set iniciou(bool value) {
    _$iniciouAtom.reportWrite(value, super.iniciou, () {
      super.iniciou = value;
    });
  }

  final _$userAtom = Atom(name: '_CertidaoControllerBase.user');

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

  final _$carregarAsyncAction = AsyncAction('_CertidaoControllerBase.carregar');

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  final _$imprimirAsyncAction = AsyncAction('_CertidaoControllerBase.imprimir');

  @override
  Future<dynamic> imprimir(Certidao certidao) {
    return _$imprimirAsyncAction.run(() => super.imprimir(certidao));
  }

  final _$_CertidaoControllerBaseActionController =
      ActionController(name: '_CertidaoControllerBase');

  @override
  void init() {
    final _$actionInfo = _$_CertidaoControllerBaseActionController.startAction(
        name: '_CertidaoControllerBase.init');
    try {
      return super.init();
    } finally {
      _$_CertidaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
certidaos: ${certidaos},
isLoading: ${isLoading},
iniciou: ${iniciou},
user: ${user}
    ''';
  }
}