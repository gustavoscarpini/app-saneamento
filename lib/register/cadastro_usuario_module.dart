import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cadastro_usuario_controller.dart';
import 'cadastro_usuario_page.dart';
import 'cadastro_usuario_repository.dart';

class CadastroUsuarioModule extends ChildModule {
  static Inject get to => Inject<CadastroUsuarioModule>.of();

  @override
  List<Bind> get binds => [
    Bind((i) => CadastroUsuarioController(i.get<CadastroUsuarioRepository>())),
    Bind((i) => CadastroUsuarioRepository(i.get<Dio>()))
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (context, args) => CadastroUsuarioPage()),
  ];
}