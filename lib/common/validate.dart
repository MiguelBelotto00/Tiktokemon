import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:tiktokemon/common/constant.dart';

class Validate{
  var data;
  Validate({
    this.data
});

  static Widget errorWidget(String error, {String content = ""}){
    switch(error){
      case Constant.CONECTION_DISABLE:
        return textError("Error en la conexion $content");
      case Constant.WIFI_DISABLE:
        return textError("Error en la conexion del dispositivo $content");
      case Constant.SERVER_ERROR:
        return textError("Error en el servidor $content");
      case Constant.MESSAGE:
        return textError("$content");
      default:
        return textError("");
    }
  }
  static textError(text){
    return Text(text, style: const TextStyle(color: Colors.black,fontSize: 40.0));
  }

  static connectionError({VoidCallback? method}) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult == ConnectivityResult.none){
      return errorWidget(Constant.CONECTION_DISABLE);
    }else{
      return method!();
    }
  }



}