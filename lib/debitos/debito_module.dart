import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'debito_controller.dart';
import 'debito_page.dart';
import 'debito_repository.dart';

class DebitoModule extends Module {

  @override
  List<Bind> get binds => [
        Bind((i) => DebitoController(i.get<DebitoRepository>())),
        Bind((i) => DebitoRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => DebitoPage()),
      ];
}
