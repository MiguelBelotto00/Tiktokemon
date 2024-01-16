import 'package:flutter/material.dart';
import 'package:tiktokemon/class/class.dart';
import 'package:tiktokemon/widgets/container_card.dart';
import 'package:tiktokemon/widgets/header_fav_poke.dart';
import 'package:tiktokemon/widgets/material_color_data.dart';

class ContainerStackData extends StatelessWidget {
  final Pokemon? pokemon;
  const ContainerStackData({super.key, this.pokemon});
  @override
  Widget build(BuildContext context) {
    var materialColorDataResponse =
        MaterialColorData.colorData(pokemon!.types![0].type!.name);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: materialColorDataResponse,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(children: [
          HeaderFavPokemon(
            pokemon: pokemon,
            colors: materialColorDataResponse,
          ),
          ContainerCard(
            pokemon: pokemon,
            colors: materialColorDataResponse,
          ),
          Container(
            width: (width * 0.7),
            height: (height * 0.7),
            margin: EdgeInsets.only(left: width * 0.15, top: height * 0.05),
            child: Image(
              image: NetworkImage(pokemon!.sprites!.other!.home!.frontDefault),
              width: (width * 0.5),
              height: (height * 0.7),
            ),
          ),
        ]);
      }),
    );
  }
}
