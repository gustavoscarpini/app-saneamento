import 'package:appcontribuinte/domains/usuario.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';


part 'config_controller.g.dart';

class ConfigController = _ConfigControllerBase with _$ConfigController;

abstract class _ConfigControllerBase with Store {


  _ConfigControllerBase();

  @computed
  Usuario get usuario => GetIt.instance<Usuario>();


}
