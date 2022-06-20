// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmpresaController on _EmpresaControllerBase, Store {
  late final _$empresasAtom =
      Atom(name: '_EmpresaControllerBase.empresas', context: context);

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

  late final _$alvarasAtom =
      Atom(name: '_EmpresaControllerBase.alvaras', context: context);

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
      Atom(name: '_EmpresaControllerBase.isLoading', context: context);

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
      Atom(name: '_EmpresaControllerBase.user', context: context);

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
      AsyncAction('_EmpresaControllerBase.carregar', context: context);

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$carregarAlvarasAsyncAction =
      AsyncAction('_EmpresaControllerBase.carregarAlvaras', context: context);

  @override
  Future<dynamic> carregarAlvaras(Empresa empresa) {
    return _$carregarAlvarasAsyncAction
        .run(() => super.carregarAlvaras(empresa));
  }

  late final _$imprimirCadastroAsyncAction =
      AsyncAction('_EmpresaControllerBase.imprimirCadastro', context: context);

  @override
  Future<dynamic> imprimirCadastro(String? inscricao) {
    return _$imprimirCadastroAsyncAction
        .run(() => super.imprimirCadastro(inscricao));
  }

  late final _$imprimirAlvaraAsyncAction =
      AsyncAction('_EmpresaControllerBase.imprimirAlvara', context: context);

  @override
  Future<dynamic> imprimirAlvara(int? alvara) {
    return _$imprimirAlvaraAsyncAction.run(() => super.imprimirAlvara(alvara));
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
