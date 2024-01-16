/*
* Este renderiza las cards de lo que seria las estadisticas del pokemon
* ya sea HP,WEIGHT,HEIGHT.
*
* */
import 'package:flutter/material.dart';

class ContenedorDelTipo extends StatelessWidget {
  final String? type;
  final String points;
  final Color colors;
  const ContenedorDelTipo(
      {super.key,
      required this.type,
      required this.points,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    final heightContenedoresHabs = (MediaQuery.of(context).size.height * 0.1);
    final widthContenedoresHabs = (MediaQuery.of(context).size.width * 0.17);

    final contenedorNombreDeHabilidades = Container(
      width: widthContenedoresHabs,
      height: heightContenedoresHabs,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Text(
        type.toString(),
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            overflow: TextOverflow.visible),
        textAlign: TextAlign.center,
      ),
    );
    final contenedorPoderDeHabilidades = Container(
      width: widthContenedoresHabs,
      height: heightContenedoresHabs,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Text(
        points.toString(),
        style: const TextStyle(
          color: Colors.black26,
          fontSize: 15.0,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.center,
      ),
    );
    final width = (MediaQuery.of(context).size.width * 0.37);
    final height = (MediaQuery.of(context).size.width * 0.17);
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [contenedorNombreDeHabilidades, contenedorPoderDeHabilidades],
      ),
    );
  }
}
