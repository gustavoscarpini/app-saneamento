import 'package:appcontribuinte/domains/alvara.dart';
import 'package:appcontribuinte/domains/protocolo.dart';
import 'package:appcontribuinte/domains/usuario.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'protocolo_repository.dart';

part 'protocolo_controller.g.dart';

class ProtocoloController = _ProtocoloControllerBase with _$ProtocoloController;

abstract class _ProtocoloControllerBase with Store {
  final ProtocoloRepository repo;

  _ProtocoloControllerBase(
    this.repo,
  );

  @observable
  ObservableList<Protocolo> protocolos = ObservableList();

  @observable
  ObservableList<Alvara> alvaras = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  Usuario user;

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    protocolos.clear();
    repo.consultarPorCPF(user.pessoa.cpfCnpj).then((value) {
      protocolos.addAll(value);
      isLoading = false;
    });
  }

  @action
  Future imprimirCadastro(String inscricao) async {
    isLoading = true;
    repo.imprimirCadastro(user.pessoa.cpfCnpj, inscricao).then((value) {
      isLoading = false;
    });
  }

  @action
  Future imprimirAlvara(int alvara) async {
    isLoading = true;
    repo.imprimirAlvara(user.pessoa.cpfCnpj, alvara).then((value) {
      isLoading = false;
    });
  }
}
