import 'package:appcontribuinte/domains/register.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dio/dio.dart';

class CadastroUsuarioRepository {
  final Dio _client;

  CadastroUsuarioRepository(this._client);

  Future<int> salvarCadastroUsuario(Register register) async {
    try {
      var response = await _client.post("/api/criar-usuario-app", data: register);
      return response.statusCode;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<Register> consultarCPF(String cpf) async {
    try {
      var response = await _client.get("/api/cpf-disponivel?cpf=${CPFValidator.strip(cpf)}");
      if (response.statusCode == 200) {
        return Register.fromJson(response.data);
      } else {
        return Register(mensagem: "CPF Disponível para cadastro");
      }
    } on DioError catch (e) {
      print("DEU RUUUUIM ${e.error}");
      return Register(mensagem: "CPF Disponível para cadastro");
    }
  }
}
