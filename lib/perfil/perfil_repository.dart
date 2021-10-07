import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dio/dio.dart';

class PerfilRepository {
  final Dio _client;

  PerfilRepository(this._client);


  Future trocarSenha(String cpf, String novaSenha) async {
    try {
      var response = await _client
          .get("/api/alterar-senha?cpf=${CPFValidator.strip(cpf)}&novaSenha=${novaSenha}");
      return response.data;
    } on DioError catch (e) {
      print("DEU RUUUUIM ${e.error}");
      throw e;
    }
  }

}
