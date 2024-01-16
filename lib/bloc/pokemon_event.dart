part of 'pokemon_bloc.dart';

abstract class PokemonEvent {}

class GetPokemon extends PokemonEvent {
  GetPokemon({
    required this.index,
  });
  final String index;
}

class SavePokemon extends PokemonEvent {
  SavePokemon({
    required this.pokemon,
  });

  final Pokemon pokemon;
}

class DeletePokemon extends PokemonEvent {
  DeletePokemon({
    required this.pokemon,
  });

  final Pokemon pokemon;
}
