import 'package:dio/dio.dart';

class Dataservice {
  final String _url = "http://localhost:8000/api/";

  Dio dio = Dio();

  LoginService(String username, String password) async {
    final Response = await dio.post('${_url}loginuser', data: {
      'username': username,
      'password': password,
    });
    print(Response.data);
  }
}
