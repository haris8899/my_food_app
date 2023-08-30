import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String AppBaseUrl;
  late Map<String, String> _mainheaders;
  ApiClient({required this.AppBaseUrl}) {
    baseUrl = AppBaseUrl;
    timeout = Duration(seconds: 30);
    token = "";
    _mainheaders = {
      'Content_type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
