// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itbi_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItbiController on _ItbiControllerBase, Store {
  final _$itbisAtom = Atom(name: '_ItbiControllerBase.itbis');

  @override
  ObservableList<Itbi> get itbis {
    _$itbisAtom.reportRead();
    return super.itbis;
  }

  @override
  set itbis(ObservableList<Itbi> value) {
    _$itbisAtom.reportWrite(value, super.itbis, () {
      super.itbis = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ItbiControllerBase.isLoading');

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

  final _$iniciouAtom = Atom(name: '_ItbiControllerBase.iniciou');

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

  final _$userAtom = Atom(name: '_ItbiControllerBase.user');

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

  final _$carregarAsyncAction = AsyncAction('_ItbiControllerBase.carregar');

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  final _$imprimirAsyncAction = AsyncAction('_ItbiControllerBase.imprimir');

  @override
  Future<dynamic> imprimir(Itbi itbi) {
    return _$imprimirAsyncAction.run(() => super.imprimir(itbi));
  }

  final _$_ItbiControllerBaseActionController =
      ActionController(name: '_ItbiControllerBase');

  @override
  void init() {
    final _$actionInfo = _$_ItbiControllerBaseActionController.startAction(
        name: '_ItbiControllerBase.init');
    try {
      return super.init();
    } finally {
      _$_ItbiControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itbis: ${itbis},
isLoading: ${isLoading},
iniciou: ${iniciou},
user: ${user}
    ''';
  }
}
