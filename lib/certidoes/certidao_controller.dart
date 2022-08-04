import 'package:appcontribuinte/domains/alvara.dart';
import 'package:appcontribuinte/domains/certidao.dart';
import 'package:appcontribuinte/domains/usuario.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'certidao_repository.dart';

part 'certidao_controller.g.dart';

class CertidaoController = _CertidaoControllerBase with _$CertidaoController;

abstract class _CertidaoControllerBase with Store {
  final CertidaoRepository repo;

  _CertidaoControllerBase(
    this.repo,
  );

  int? page;

  @observable
  ObservableList<Certidao> certidaos = ObservableList();

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
    certidaos.clear();
    page = 0;
  }

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    repo.consultarPorCPF(user!.pessoa!.cpfCnpj, page).then((value) {
      certidaos.addAll(value);
      isLoading = false;
      iniciou = true;
    }).onError((dynamic error, stackTrace) {
      isLoading = false;
      iniciou = true;
      zerarCertidoes();
      print("Errinho $error >> $iniciou >> $isLoading");
    });
  }

  @action
  Future imprimir(Certidao certidao) async {
    isLoading = true;
    repo.imprimir(certidao).then((value) {
      isLoading = false;
    });
  }
}
