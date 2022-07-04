import 'package:flutter/material.dart';
import 'package:tiktokemon/widgets/container_card.dart';
import 'package:tiktokemon/widgets/header_fav_poke.dart';
import 'package:tiktokemon/widgets/material_color_data.dart';

import '../class/pokemon.dart';
class ContainerStackData extends StatelessWidget{
  late Pokemon? pokemon;
  ContainerStackData({Key? key, this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var materialColorDataResponse = MaterialColorData.colorData(pokemon!.types![0].type!.name);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: materialColorDataResponse,
      child: Stack(children: [
        HeaderFavPokemon(pokemon: pokemon,),
        ContainerCard( pokemon: pokemon,colors: materialColorDataResponse,),
        Container(
          margin: EdgeInsets.only(top: 200.0,right: 30.0,left: 30.0),
          child: Image(image: NetworkImage(
              pokemon!.sprites!.other!.home!.frontDefault
          ),width: 340.0,height: 340.0,),
        )
      ]),
    );
  }
}