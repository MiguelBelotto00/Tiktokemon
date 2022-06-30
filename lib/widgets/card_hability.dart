import 'package:flutter/material.dart';
import 'package:tiktokemon/widgets/contenedor_del_tipo.dart';
class CardHability extends StatelessWidget {
  final String type;
  final String points;
  const CardHability({Key? key, required this.type, required this.points}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: FittedBox(
        child: Row(
          children: [
            ContenedorDelTipo(type: type, points: points)
          ],
        ),
      ),
    );
  }
}

