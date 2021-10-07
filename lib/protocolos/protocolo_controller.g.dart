// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocolo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProtocoloController on _ProtocoloControllerBase, Store {
  final _$protocolosAtom = Atom(name: '_ProtocoloControllerBase.protocolos');

  @override
  ObservableList<Protocolo> get protocolos {
    _$protocolosAtom.reportRead();
    return super.protocolos;
  }

  @override
  set protocolos(ObservableList<Protocolo> value) {
    _$protocolosAtom.reportWrite(value, super.protocolos, () {
      super.protocolos = value;
    });
  }

  final _$alvarasAtom = Atom(name: '_ProtocoloControllerBase.alvaras');

  @override
  ObservableList<Alvara> get alvaras {
    _$alvarasAtom.reportRead();
    return super.alvaras;
  }

  @override
  set alvaras(ObservableList<Alvara> value) {
    _$alvarasAtom.reportWrite(value, super.alvaras, () {
      super.alvaras = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProtocoloControllerBase.isLoading');

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

  final _$userAtom = Atom(name: '_ProtocoloControllerBase.user');

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

  final _$carregarAsyncAction =
      AsyncAction('_ProtocoloControllerBase.carregar');

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  final _$imprimirAsyncAction =
      AsyncAction('_ProtocoloControllerBase.imprimir');

  @override
  Future<dynamic> imprimir(int numero, int ano) {
    return _$imprimirAsyncAction.run(() => super.imprimir(numero, ano));
  }

  @override
  String toString() {
    return '''
protocolos: ${protocolos},
alvaras: ${alvaras},
isLoading: ${isLoading},
user: ${user}
    ''';
  }
}
