import 'dart:io';

import 'package:appcontribuinte/domains/imovel.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ImovelRepository {
  final Dio _client;

  ImovelRepository(this._client);

  Future<List<Imovel>> consultarPorCPF(String? cpf) async {
    try {
      var response = await _client
          .get("/api/tributario/imoveis/${CPFValidator.strip(cpf)}");
      print("response ${response.data}");
      return (response.data as List)
          .map((item) => Imovel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw e;
    }
  }

  Future imprimir(int? id) async {
    try {
      var response = await _client.get(
          "/api/tributario/imprimir-imovel/${id}",
        options: Options(responseType: ResponseType.bytes));
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      String path = appDocDirectory.path +
          "/BCI-$id.pdf";
      File file = File(path);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      return OpenFile.open(path);
    } on DioError catch (e) {
      throw e;
    }
  }
}
