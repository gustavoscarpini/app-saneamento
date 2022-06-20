// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itbi_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItbiController on _ItbiControllerBase, Store {
  late final _$itbisAtom =
      Atom(name: '_ItbiControllerBase.itbis', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_ItbiControllerBase.isLoading', context: context);

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
      Atom(name: '_ItbiControllerBase.iniciou', context: context);

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
      Atom(name: '_ItbiControllerBase.user', context: context);

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
      AsyncAction('_ItbiControllerBase.carregar', context: context);

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$imprimirAsyncAction =
      AsyncAction('_ItbiControllerBase.imprimir', context: context);

  @override
  Future<dynamic> imprimir(Itbi itbi) {
    return _$imprimirAsyncAction.run(() => super.imprimir(itbi));
  }

  late final _$_ItbiControllerBaseActionController =
      ActionController(name: '_ItbiControllerBase', context: context);

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
