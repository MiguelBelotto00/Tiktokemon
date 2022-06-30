import 'package:flutter/material.dart';
import 'package:tiktokemon/widgets/button_yo_te_elijo.dart';
import 'package:tiktokemon/widgets/card_hability.dart';
class ContainerCard extends StatelessWidget {
  const ContainerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Uso los MediaQuery para saber el tamaño de la pantalla y los convierto en
    // 0.3 = 30% de toda la pantalla
    //0.8 = 80% de toda la pantalla
    final heightMedia = MediaQuery.of(context).size.height*0.35;
    final widthMedia = MediaQuery.of(context).size.width*0.8;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 40.0),
          width: widthMedia,
          height: heightMedia,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:30.0),
            child: FittedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      CardHability(type: "Attack", points: "49"),
                      CardHability(type: "Defense", points: "45")
                    ],
                  ),
                  Row(
                    children: [
                      CardHability(type: "HP", points: "45"),
                      CardHability(type: "Defense", points: "16")
                    ],
                  ),
                  ButtonYoTeElijo()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
