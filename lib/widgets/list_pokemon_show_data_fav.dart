import 'package:flutter/material.dart';
import 'package:tiktokemon/widgets/material_color_data.dart';

import '../bloc/pokemon_bloc.dart';
import '../class/pokemon.dart';
class ListPokemonShowDataFav extends StatefulWidget{
  final List<Pokemon>? pokemons;
  const ListPokemonShowDataFav({Key? key, this.pokemons}) : super(key: key);

  @override
  State<ListPokemonShowDataFav> createState() => _ListPokemonShowDataFav();
}
class _ListPokemonShowDataFav extends State<ListPokemonShowDataFav>{
  var pokemonBloc = PokemonBloc();
  void onDelete(Pokemon pokemones){
    setState((){
      pokemonBloc.deletePokemonData(pokemones);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: widget.pokemons!.map((pokemones) {
        var materialColorDataResponse =
        MaterialColorData.colorData(pokemones.types![0].type!.name);
        return Container(
          height: (MediaQuery.of(context).size.height * 0.15),
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            color: materialColorDataResponse,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FittedBox(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              pokemones.sprites!.other!.home!.frontDefault))),
                ),
              ),
              Text(
                pokemones.name.toString(),
                style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 40.0,
                ),
                color: Colors.white,
                onPressed: () => onDelete(pokemones),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

}
