import 'package:appcontribuinte/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';

Future<void> main() async {
  return runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
