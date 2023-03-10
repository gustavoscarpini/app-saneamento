// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imovel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImovelController on _ImovelControllerBase, Store {
  late final _$imoveisAtom =
      Atom(name: '_ImovelControllerBase.imoveis', context: context);

  @override
  ObservableList<Imovel> get imoveis {
    _$imoveisAtom.reportRead();
    return super.imoveis;
  }

  @override
  set imoveis(ObservableList<Imovel> value) {
    _$imoveisAtom.reportWrite(value, super.imoveis, () {
      super.imoveis = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ImovelControllerBase.isLoading', context: context);

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
      Atom(name: '_ImovelControllerBase.user', context: context);

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
      AsyncAction('_ImovelControllerBase.carregar', context: context);

  @override
  Future<dynamic> carregar() {
    return _$carregarAsyncAction.run(() => super.carregar());
  }

  late final _$imprimirAsyncAction =
      AsyncAction('_ImovelControllerBase.imprimir', context: context);

  @override
  Future<dynamic> imprimir(int? id) {
    return _$imprimirAsyncAction.run(() => super.imprimir(id));
  }

  @override
  String toString() {
    return '''
imoveis: ${imoveis},
isLoading: ${isLoading},
user: ${user}
    ''';
  }
}
