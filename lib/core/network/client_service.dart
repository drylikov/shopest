import 'dart:async';

import 'package:dio/dio.dart';

class ClientService {
  static final ClientService _clientService = ClientService._internal();
  final Dio _dio = Dio();
  Dio get dio => _dio;

  factory ClientService() => _clientService;

  ClientService._internal();

  Future<Response<dynamic>> get(
    String path, [
    Map<String, dynamic>? params,
  ]) async {
    Response<dynamic> response;
    if (params != null) {
      response =
          await _dio.get<Future<Response>>(path, queryParameters: params);
    } else {
      response = await _dio.get<Future<Response>>(path);
    }
    return response;
  }
}
