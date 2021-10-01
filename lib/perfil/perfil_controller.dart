import 'package:appcontribuinte/domains/usuario.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'perfil_repository.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  final PerfilRepository repo;

  _PerfilControllerBase(
    this.repo,
  );

  @observable
  bool isLoading = false;

  @observable
  Usuario user;

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
  }
}
