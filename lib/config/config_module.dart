import 'package:flutter_modular/flutter_modular.dart';
import 'config_controller.dart';
import 'config_page.dart';

class ConfigModule extends Module {

  @override
  List<Bind> get binds => [Bind((i) => ConfigController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => ConfigPage()),
      ];
}
