import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';
import 'package:tiktokemon/class/pokemon_class.dart';
import 'package:tiktokemon/widgets/material_color_data.dart';

class ListPokemonShowDataFav extends StatefulWidget {
  final List<Pokemon>? pokemons;
  const ListPokemonShowDataFav({super.key, this.pokemons});

  @override
  State<ListPokemonShowDataFav> createState() => _ListPokemonShowDataFav();
}

class _ListPokemonShowDataFav extends State<ListPokemonShowDataFav> {
  void onDelete(Pokemon pokemones) {
    context.read<PokemonBloc>().add(DeletePokemon(pokemon: pokemones));
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
