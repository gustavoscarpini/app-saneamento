// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigController on _ConfigControllerBase, Store {
  Computed<Usuario> _$usuarioComputed;

  @override
  Usuario get usuario =>
      (_$usuarioComputed ??= Computed<Usuario>(() => super.usuario,
              name: '_ConfigControllerBase.usuario'))
          .value;

  @override
  String toString() {
    return '''
usuario: ${usuario}
    ''';
  }
}
