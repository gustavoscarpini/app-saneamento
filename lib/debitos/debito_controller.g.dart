// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debito_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DebitoController on _DebitoControllerBase, Store {
  late final _$debitosAtom =
      Atom(name: '_DebitoControllerBase.debitos', context: context);

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

  late final _$alvarasAtom =
      Atom(name: '_DebitoControllerBase.alvaras', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_DebitoControllerBase.isLoading', context: context);

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

  late final _$userAtom =
      Atom(name: '_DebitoControllerBase.user', context: context);

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
      AsyncAction('_DebitoControllerBase.carregar', context: context);

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$imprimirAsyncAction =
      AsyncAction('_DebitoControllerBase.imprimir', context: context);

  @override
  Future<dynamic> imprimir(Debito debito) {
    return _$imprimirAsyncAction.run(() => super.imprimir(debito));
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
