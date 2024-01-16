import 'package:flutter/material.dart';
import 'package:tiktokemon/widgets/contenedor_del_tipo.dart';

class CardHability extends StatelessWidget {
  final String? type;
  final int? points;
  final Color colors;
  const CardHability({super.key, this.type, this.points, required this.colors});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.37,
      margin: const EdgeInsets.all(5.0),
      alignment: Alignment.center,
      child: Row(
        children: [
          ContenedorDelTipo(
            type: type,
            points: points.toString(),
            colors: colors,
          )
        ],
      ),
    );
  }
}
