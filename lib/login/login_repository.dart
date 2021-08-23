import 'dart:convert';

import 'package:appcontribuinte/constants.dart';
import 'package:appcontribuinte/domains/usuario.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository extends Disposable {
  final Dio _client;
  SharedPreferences prefs;

  LoginRepository(this._client);

  Future resetPassordInit(String login) async {
    return _client.post("/api/account/reset_password/init", data: login);
  }

  Future<Usuario> login(String login, String senha) async {
    try {
      prefs = await SharedPreferences.getInstance();
      var response = await http.post(BASE_URL + '/auth/login',
          body: jsonEncode(<String, String>{
            'username': login,
            'password': senha,
          }),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var usuario = Usuario.fromJson(json.decode(response.body));
      if (usuario != null && usuario.token != null) {
        registerSingleton(usuario);
      }
      return usuario;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  void registerSingleton(Usuario user) {
    if (GetIt.instance.isRegistered<Usuario>()) {
      GetIt.instance.unregister<Usuario>();
    }
    GetIt.instance.registerSingleton<Usuario>(user);
    prefs.setString("token", user.token);
  }

  @override
  void dispose() {}
}
