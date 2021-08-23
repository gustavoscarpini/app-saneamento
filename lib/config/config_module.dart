import 'package:flutter_modular/flutter_modular.dart';
import 'config_controller.dart';
import 'config_page.dart';

class ConfigModule extends ChildModule {
  static Inject get to => Inject<ConfigModule>.of();

  @override
  List<Bind> get binds => [Bind((i) => ConfigController())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => ConfigPage()),
      ];
}
