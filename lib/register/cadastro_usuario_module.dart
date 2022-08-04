import 'package:appcontribuinte/dio/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cadastro_usuario_controller.dart';
import 'cadastro_usuario_page.dart';
import 'cadastro_usuario_repository.dart';

class CadastroUsuarioModule extends Module {

  @override
  List<Bind> get binds => [
        Bind((i) =>
            CadastroUsuarioController(i.get<CadastroUsuarioRepository>())),
        Bind((i) => CadastroUsuarioRepository(CustomDio().dio))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => CadastroUsuarioPage()),
      ];
}
