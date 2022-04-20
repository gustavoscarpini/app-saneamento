// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debito_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DebitoController on _DebitoControllerBase, Store {
  final _$debitosAtom = Atom(name: '_DebitoControllerBase.debitos');

  @override
  ObservableList<Debito> get debitos {
    _$debitosAtom.reportRead();
    return super.debitos;
  }

  @override
  set debitos(ObservableList<Debito> value) {
    _$debitosAtom.reportWrite(value, super.debitos, () {
      super.debitos = value;
    });
  }

  final _$alvarasAtom = Atom(name: '_DebitoControllerBase.alvaras');

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

  final _$isLoadingAtom = Atom(name: '_DebitoControllerBase.isLoading');

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

  final _$userAtom = Atom(name: '_DebitoControllerBase.user');

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

  final _$carregarAsyncAction = AsyncAction('_DebitoControllerBase.carregar');

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  final _$imprimirAsyncAction = AsyncAction('_DebitoControllerBase.imprimir');

  @override
  Future<dynamic> imprimir(Debito debito) {
    return _$imprimirAsyncAction.run(() => super.imprimir(debito));
  }

  @override
  Future<dynamic> gerarQrCodePix(Debito debito) {
    return super.gerarQrCodePix(debito);
  }

  @override
  String toString() {
    return '''
debitos: ${debitos},
alvaras: ${alvaras},
isLoading: ${isLoading},
user: ${user}
    ''';
  }
}
