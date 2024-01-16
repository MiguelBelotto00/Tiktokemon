import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';
import 'package:tiktokemon/widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PokemonBloc>().add(GetPokemon(index: '1'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: 250,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (index < state.pokemonList.length) {
                  // Si ya tenemos el Pokémon cargado, reutilizarlo
                  return ContainerStackData(pokemon: state.pokemonList[index]);
                } else if (state.pokemonStatus == PokemonStatus.loading) {
                  // Pokémon aún no cargado, mostrar indicador de carga
                  return const LoaderScreen();
                } else {
                  // Pokémon aún no cargado, realizar la llamada a la API
                  context
                      .read<PokemonBloc>()
                      .add(GetPokemon(index: '${index + 1}'));
                  return const LoaderScreen(); // O cualquier widget de carga
                }
              },
            );
          },
        ),
      ),
    );
  }
}
