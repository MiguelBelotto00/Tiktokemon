import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tiktokemon/class/class.dart';
import 'package:tiktokemon/config/app_config.dart';

class NetworkServices {
  final Dio dio = Dio();
  Future<Pokemon> getPokemon(String index) async {
    debugPrint("Index: $index");
    final uri = '${AppConfig.baseUrl}/pokemon/$index/';
    final response = await dio.get(uri);
    debugPrint("El servicio respondio: $response");
    return Pokemon.fromJson(response.data);
  }
}
//pokemon?limit=100000&offset=0.