import 'package:appcontribuinte/domains/itbi.dart';
import 'package:appcontribuinte/domains/usuario.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'itbi_repository.dart';

part 'itbi_controller.g.dart';

class ItbiController = _ItbiControllerBase with _$ItbiController;

abstract class _ItbiControllerBase with Store {
  final ItbiRepository repo;

  _ItbiControllerBase(
    this.repo,
  );

  int? page;

  @observable
  ObservableList<Itbi> itbis = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  bool iniciou = false;

  @observable
  Usuario? user;

  @action
  void init() {
    iniciou = false;
    zerarCertidoes();
    carregar();
  }

  void zerarCertidoes() {
    itbis.clear();
    page = 0;
  }

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    repo.consultarPorCPF(user!.pessoa!.cpfCnpj, page).then((value) {
      itbis.addAll(value);
      isLoading = false;
      iniciou = true;
    }).onError((dynamic error, stackTrace) {
      isLoading = false;
      iniciou = true;
      zerarCertidoes();
      print("Errinho $error >> $iniciou >> $isLoading");
      throw error;
    });
  }

  @action
  Future imprimir(Itbi itbi) async {
    isLoading = true;
    repo.imprimir(itbi).then((value) {
      isLoading = false;
    });
  }
}
