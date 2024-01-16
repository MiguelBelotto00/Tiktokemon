part of 'pokemon_bloc.dart';

enum PokemonStatus { loading, success, error }

class PokemonState {
  List<Pokemon> pokemonList;
  List<Pokemon>? favoritePokemon;
  PokemonStatus pokemonStatus;
  Map<int, Pokemon> loadedPokemon;

  PokemonState({
    required this.pokemonList,
    this.favoritePokemon = const <Pokemon>[],
    this.pokemonStatus = PokemonStatus.loading,
    this.loadedPokemon = const <int, Pokemon>{},
  });

  PokemonState copyWith(
      {List<Pokemon>? pokemonList,
      List<Pokemon>? favoritePokemon,
      PokemonStatus? pokemonStatus,
      Map<int, Pokemon>? loadedPokemon}) {
    return PokemonState(
      pokemonList: pokemonList ?? this.pokemonList,
      favoritePokemon: favoritePokemon ?? this.favoritePokemon,
      pokemonStatus: pokemonStatus ?? this.pokemonStatus,
      loadedPokemon: loadedPokemon ?? this.loadedPokemon,
    );
  }
}
