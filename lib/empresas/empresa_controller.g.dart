// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmpresaController on _EmpresaControllerBase, Store {
  final _$empresasAtom = Atom(name: '_EmpresaControllerBase.empresas');

  @override
  ObservableList<Empresa> get empresas {
    _$empresasAtom.reportRead();
    return super.empresas;
  }

  @override
  set empresas(ObservableList<Empresa> value) {
    _$empresasAtom.reportWrite(value, super.empresas, () {
      super.empresas = value;
    });
  }

  final _$alvarasAtom = Atom(name: '_EmpresaControllerBase.alvaras');

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

  final _$isLoadingAtom = Atom(name: '_EmpresaControllerBase.isLoading');

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

  final _$userAtom = Atom(name: '_EmpresaControllerBase.user');

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

  final _$carregarAsyncAction = AsyncAction('_EmpresaControllerBase.carregar');

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  final _$carregarAlvarasAsyncAction =
      AsyncAction('_EmpresaControllerBase.carregarAlvaras');

  @override
  Future<dynamic> carregarAlvaras(Empresa empresa) {
    return _$carregarAlvarasAsyncAction
        .run(() => super.carregarAlvaras(empresa));
  }

  final _$imprimirAsyncAction = AsyncAction('_EmpresaControllerBase.imprimir');

  @override
  Future<dynamic> imprimirCadastro(String inscricao) {
    return _$imprimirAsyncAction.run(() => super.imprimirCadastro(inscricao));
  }

  @override
  String toString() {
    return '''
empresas: ${empresas},
alvaras: ${alvaras},
isLoading: ${isLoading},
user: ${user}
    ''';
  }
}
