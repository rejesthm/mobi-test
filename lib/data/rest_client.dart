import 'dart:convert';

import 'package:MobiTest/data/mapper/mobi_mapper.dart';
import 'package:MobiTest/data/models/mobi_model.dart';
import 'package:dio/dio.dart';

class RestClient {
  Dio _dio;

  RestClient(this._dio);

  Future<MobiEntity> getMobiTestData() async {
    Response response = await _dio.get("/mobi_test");
    Map<String, dynamic> user = jsonDecode(response.data);
    return MobiTestMapper().fromMap(user);
  }
}
