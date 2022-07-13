import 'package:flutter/material.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';
import 'package:tiktokemon/widgets/list_pokemon_show_data_fav.dart';
import '../class/pokemon.dart';

class ListPokemonScreen extends StatefulWidget {
  const ListPokemonScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ListPokemonScreen> createState() => _ListPokemonScreen();
}
class _ListPokemonScreen extends State<ListPokemonScreen> {
  var pokemonBloc = PokemonBloc();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "Mis Favoritos",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 40.0,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: StreamBuilder<List<Pokemon>>(
            stream: pokemonBloc.getPokemon(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                       return  pokemonShowDataFav(snapshot.data,);
              }
            }),
      ),
    );
  }
}

Widget pokemonShowDataFav(List<Pokemon>? pokemons,) {
  return ListPokemonShowDataFav(pokemons: pokemons,);
}
