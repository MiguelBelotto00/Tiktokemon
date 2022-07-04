import 'package:flutter/material.dart';
import '../class/pokemon.dart';
class MaterialColorData{
  late String colors;
  MaterialColorData({
  required this.colors
  });
  static  MaterialColor colorData(colors){
    switch(colors){
      case "grass":
        return Colors.green;
      case "fire":
        return Colors.orange;
      case "poison":
        return Colors.purple;
      case "ground":
        return Colors.brown;
      case "rock":
        return Colors.blueGrey;
      case "fighting":
        return Colors.red;
      case "normal":
        return Colors.grey;
      case "water":
        return Colors.blue;
      case "electric":
        return Colors.yellow;
      case "ice":
        return Colors.cyan;
      case "dark":
        return Colors.deepPurple;
      default:
        return Colors.lime;

    }

  }
}