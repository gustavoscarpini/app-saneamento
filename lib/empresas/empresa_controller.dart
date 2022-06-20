import 'package:appcontribuinte/domains/alvara.dart';
import 'package:appcontribuinte/domains/empresa.dart';
import 'package:appcontribuinte/domains/usuario.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'empresa_repository.dart';

part 'empresa_controller.g.dart';

class EmpresaController = _EmpresaControllerBase with _$EmpresaController;

abstract class _EmpresaControllerBase with Store {
  final EmpresaRepository repo;

  _EmpresaControllerBase(
    this.repo,
  );

  @observable
  ObservableList<Empresa> empresas = ObservableList();

  @observable
  ObservableList<Alvara> alvaras = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  Usuario? user;

  @action
  Future carregar() async {
    isLoading = true;
    user = GetIt.instance<Usuario>();
    empresas.clear();
    repo.consultarPorCPF(user!.pessoa!.cpfCnpj).then((value) {
      empresas.addAll(value);
      isLoading = false;
      for (var empresa in empresas) {
        carregarAlvaras(empresa);
      }
    });
  }

  @action
  Future carregarAlvaras(Empresa empresa) async {
    isLoading = true;
    empresa.alvaras =
        await repo.consultarAlvaras(user!.pessoa!.cpfCnpj, empresa.cmc);
    isLoading = false;
  }

  @action
  Future imprimirCadastro(String? inscricao) async {
    isLoading = true;
    repo.imprimirCadastro(user!.pessoa!.cpfCnpj, inscricao).then((value) {
      isLoading = false;
    });
  }

  @action
  Future imprimirAlvara(int? alvara) async {
    isLoading = true;
    repo.imprimirAlvara(user!.pessoa!.cpfCnpj, alvara).then((value) {
      isLoading = false;
    });
  }
}
