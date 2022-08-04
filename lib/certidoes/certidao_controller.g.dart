// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certidao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CertidaoController on _CertidaoControllerBase, Store {
  late final _$certidaosAtom =
      Atom(name: '_CertidaoControllerBase.certidaos', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_CertidaoControllerBase.isLoading', context: context);

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

  late final _$iniciouAtom =
      Atom(name: '_CertidaoControllerBase.iniciou', context: context);

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

  late final _$userAtom =
      Atom(name: '_CertidaoControllerBase.user', context: context);

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

  late final _$carregarAsyncAction =
      AsyncAction('_CertidaoControllerBase.carregar', context: context);

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$imprimirAsyncAction =
      AsyncAction('_CertidaoControllerBase.imprimir', context: context);

  @override
  Future<dynamic> imprimir(Certidao certidao) {
    return _$imprimirAsyncAction.run(() => super.imprimir(certidao));
  }

  late final _$_CertidaoControllerBaseActionController =
      ActionController(name: '_CertidaoControllerBase', context: context);

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
