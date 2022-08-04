import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'protocolo_controller.dart';
import 'protocolo_page.dart';
import 'protocolo_repository.dart';

class ProtocoloModule extends Module {

  @override
  List<Bind> get binds => [
        Bind((i) => ProtocoloController(i.get<ProtocoloRepository>())),
        Bind((i) => ProtocoloRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => ProtocoloPage()),
      ];
}
