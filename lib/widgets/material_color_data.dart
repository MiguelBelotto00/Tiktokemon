import 'package:flutter/material.dart';
class MaterialColorData{
  late String colors;
  MaterialColorData({
  required this.colors
  });
  static  Color colorData(colors){
    switch(colors){
      case "grass":
        return const Color.fromRGBO(27, 255, 3, 1.0);
      case "fire":
        return const Color.fromRGBO(231, 102, 9, 1.0);
      case "poison":
        return const Color.fromRGBO(58, 38, 107, 1.0);
      case "ground":
        return const Color.fromRGBO(96, 69, 28, 1.0);
      case "rock":
        return const Color.fromRGBO(100, 68, 64, 1.0);
      case "fighting":
        return const Color.fromRGBO(232, 20, 26, 1.0);
      case "normal":
        return const Color.fromRGBO(155, 155, 155, 1.0);
      case "water":
        return const Color.fromRGBO(26, 157, 245, 1.0);
      case "electric":
        return const Color.fromRGBO(234, 228, 8, 1.0);
      case "ice":
        return const Color.fromRGBO(32, 232, 226, 1.0);
      case "dark":
        return const Color.fromRGBO(0, 0, 0, 1.0);
      case "bug":
        return const Color.fromRGBO(73, 215, 59, 1.0);
      case "flying":
        return const Color.fromRGBO(101, 199, 175, 1.0);
      case "ghost":
        return const Color.fromRGBO(132, 51, 194, 1.0);
      case "steel":
        return const Color.fromRGBO(154, 142, 142, 1.0);
      case "psychic":
        return const Color.fromRGBO(164, 119, 201, 1.0);
      case "fairy":
        return const Color.fromRGBO(255, 114, 243, 1.0);
      case "shadow":
        return const Color.fromRGBO(54, 52, 52, 1.0);
      default:
        return Colors.lime;

    }

  }
}