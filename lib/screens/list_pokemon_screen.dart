import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';
import 'package:tiktokemon/widgets/list_pokemon_show_data_fav.dart';

class ListPokemonScreen extends StatefulWidget {
  const ListPokemonScreen({
    super.key,
  });
  @override
  State<ListPokemonScreen> createState() => _ListPokemonScreen();
}

class _ListPokemonScreen extends State<ListPokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            return ListPokemonShowDataFav(
              pokemons: state.favoritePokemon,
            );
          },
        ),
      ),
    );
  }
}
