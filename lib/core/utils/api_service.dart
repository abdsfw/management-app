// import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mangment_app/core/cache/cashe_helper.dart';
// import 'package:http/http.dart' as http;

class ApiService {
  final _baseUrl = "";
  final Dio dio;

  ApiService(this.dio);
  // Future<Map<String, dynamic>> get({required String endPoint}) async {
  //   Uri url = Uri.parse(_baseUrl + endPoint);
  //   http.Response response = await http.get(url);
  //   var body = jsonDecode(response.body);

  //   return body;
  // }

  Future<Map<String, dynamic>> get(
      {required String endPoint, CancelToken? cancelToken}) async {
    String? token = await CasheHelper.getData(key: "");

    dio.options.headers["Authorization"] = "Bearer $token";
    print('before send request');

    var response = await dio.get('$_baseUrl$endPoint');
    print('-----------------------------------------------------------');
    // print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required var data,
    bool isLogin = false,
  }) async {
    String token = (isLogin) ? '' : await CasheHelper.getData(key: "");
    (isLogin) ? null : dio.options.headers["Authorization"] = "Bearer $token";
    print(data);
    var response = await dio.post('$_baseUrl$endPoint', data: data);
    return response.data;
  }
}
