import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domains/usuario.dart';

class CustomInterceptors extends Interceptor {
  final Dio _dio;
  final bool usaToken;
  CustomInterceptors(this._dio, this.usaToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        "REQUEST[${options.method}] => PATH:${options.baseUrl + options.path}");
    Usuario? user = GetIt.instance<Usuario>();
    if (user != null && user.token != null && user.token!.isNotEmpty && usaToken) {
      try {
        print("Bearer " + user.token!);
        options.headers["Authorization"] = "Bearer " + user.token!;
      } on DioError catch (e) {
        print("ERRO AO PEGAR O TOKEN ${e.error}");
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError error, ErrorInterceptorHandler handler) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print(
        "ERROR[${error.response?.statusCode}] => PATH: ${error}"); // Do something with response error

    // if (error.response?.statusCode == 401) {
    //   Options options = error.response.;
    //   String login = prefs.getString(KEY_USERLOGIN);
    //   String senha = prefs.getString(KEY_PASSWORD);
    //   if (login != null &&
    //       login.isNotEmpty &&
    //       senha != null &&
    //       senha.isNotEmpty) {
    //     LoginRepository _loginRepository = LoginRepository(_dio);
    //     _loginRepository.login(login, senha).then((e) {
    //       //repeat
    //       return _dio.request(error.response.request.path,
    //           options: options);
    //     });
    //   }
    // }
    return super.onError(error, handler);
  }
}
