import 'package:flutter/material.dart';
import 'package:tiktokemon/widgets/button_yo_te_elijo.dart';
import 'package:tiktokemon/widgets/card_hability.dart';
import '../class/pokemon.dart';
class ContainerCard extends StatelessWidget {
  final Pokemon? pokemon;
  final Color colors;

   const ContainerCard({Key? key, required this.pokemon, required this.colors}) : super(key: key);

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
          alignment: Alignment.center,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CardHability(type: pokemon!.stats![0].stat!.name, points: pokemon!.stats![0].baseStat,colors: colors,),
                      CardHability(type: pokemon!.stats![1].stat!.name, points: pokemon!.stats![1].baseStat,colors: colors,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CardHability(type: pokemon!.stats![2].stat!.name, points: pokemon!.stats![2].baseStat,colors: colors,),
                      CardType(type: pokemon!.types![0].type!.name)
                    ],
                  ),
                  ButtonYoTeElijo(pokemon: pokemon,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardType extends StatelessWidget{
  final String? type;
  const CardType({Key? key, this.type=""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightContenedoresHabs = (MediaQuery.of(context).size.height*0.08);
    final widthContenedoresHabs = (MediaQuery.of(context).size.width*0.33);
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(right: 20.0,left: 10.0),
      width: widthContenedoresHabs,
      height: heightContenedoresHabs,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: Colors.grey,width: 0.5),
      ),
      child: Text(
        "Type: ${type.toString()}",
        style: const TextStyle(
          color: Colors.black26,
          fontSize: 15.0,
          overflow: TextOverflow.ellipsis,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }



}
