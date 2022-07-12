import 'package:flutter/material.dart';
import 'package:tiktokemon/widgets/container_card.dart';
import 'package:tiktokemon/widgets/header_fav_poke.dart';
import 'package:tiktokemon/widgets/material_color_data.dart';

import '../class/pokemon.dart';
class ContainerStackData extends StatelessWidget{
  final Pokemon? pokemon;
  const ContainerStackData({Key? key, this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var materialColorDataResponse = MaterialColorData.colorData(pokemon!.types![0].type!.name);
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width,
      height: _height,
      color: materialColorDataResponse,
      child: Stack(children: [
        HeaderFavPokemon(pokemon: pokemon,colors: materialColorDataResponse,),
        ContainerCard( pokemon: pokemon,colors: materialColorDataResponse,),
        Container(
            width: (_width*0.7),
            height: (_height*0.7),
            margin: EdgeInsets.only(left: _width*0.15 ,top: _height*0.05),
          child: Image(image: NetworkImage(
                pokemon!.sprites!.other!.home!.frontDefault
            ),width: (_width*0.5),height: (_height*0.7),),
          ),
      ]),
    );
  }
}