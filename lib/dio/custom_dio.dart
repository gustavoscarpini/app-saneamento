import 'dart:convert';

import 'package:appcontribuinte/domains/token.dart';
import 'package:appcontribuinte/login/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class CustomDio {
  Dio _dio;

  CustomDio() {
    if (_dio == null) {
      _dio = Dio();

      _dio.interceptors.clear();

      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        print("REQUEST[${options.method}] => PATH: ${options.path}");

        SharedPreferences prefs = await SharedPreferences.getInstance();

        if (prefs.getString("token") != null) {
          var token = Token.fromJson(json.decode(prefs.getString("token")));
          print("=== TOKEN ${token.accessToken}");
          // Do something before request is sent
          options.headers["Authorization"] = "Bearer " + token.accessToken;
        }


        return options;
      }, onResponse: (Response response) {
        print(
            "RESPONSE: [${response.statusCode}] => PATH: [${response.request.path}] => DATA: [${response.data}]");
        // Do something with response data
        return response; // continue
      }, onError: (DioError error) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        print(
            "ERROR[${error.response?.statusCode}] => PATH: ${error.request.path}"); // Do something with response error

        if (error.response?.statusCode == 401) {
          Options options = error.response.request;
          String login = prefs.getString(KEY_USERLOGIN);
          String senha = prefs.getString(KEY_PASSWORD);
          print("vai tentar novo login ${login}  ${senha}");

          if (login != null &&
              login.isNotEmpty &&
              senha != null &&
              senha.isNotEmpty) {
            LoginRepository _loginRepository = LoginRepository(_dio);

            _loginRepository.login(login, senha).then((e) {
              //repeat
              return _dio.request(error.response.request.path,
                  options: options);
            });
          }
        }
        return error;
      }));
      _dio.options.baseUrl = BASE_URL;
      _dio.options.connectTimeout = 50000;
    }
  }

  Dio get dio => _dio;
}
