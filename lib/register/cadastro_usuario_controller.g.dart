// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_usuario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroUsuarioController on _CadastroUsuarioControllerBase, Store {
  final _$registerAtom = Atom(name: '_CadastroUsuarioControllerBase.register');

  @override
  Register get register {
    _$registerAtom.reportRead();
    return super.register;
  }

  @override
  set register(Register value) {
    _$registerAtom.reportWrite(value, super.register, () {
      super.register = value;
    });
  }

  final _$carregandoAtom =
      Atom(name: '_CadastroUsuarioControllerBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$salvarCadastroUsuarioAsyncAction =
      AsyncAction('_CadastroUsuarioControllerBase.salvarCadastroUsuario');

  @override
  Future<int> salvarCadastroUsuario() {
    return _$salvarCadastroUsuarioAsyncAction
        .run(() => super.salvarCadastroUsuario());
  }

  @override
  String toString() {
    return '''
register: ${register},
carregando: ${carregando}
    ''';
  }
}
