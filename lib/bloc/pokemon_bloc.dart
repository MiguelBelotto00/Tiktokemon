import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tiktokemon/class/class.dart';
import 'package:tiktokemon/services/network_service.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends HydratedBloc<PokemonEvent, PokemonState> {
  final NetworkServices networkServices;
  PokemonBloc(super.state, this.networkServices) {
    on<GetPokemon>(_getPokemon);
    on<DeletePokemon>(_deleteFavPokemonData);
    on<SavePokemon>(_addFavPokemonData);
  }

  void _getPokemon(GetPokemon event, Emitter emit) async {
    if (state.loadedPokemon.containsKey(event.index)) {
      // Si ya tenemos el Pokémon cargado, no hacemos una nueva llamada a la API
      emit(state.copyWith(
        pokemonStatus: PokemonStatus.success,
      ));
    } else {
      emit(state.copyWith(pokemonStatus: PokemonStatus.loading));
      final response = await networkServices.getPokemon(event.index);

      // Actualizamos el mapa con el nuevo Pokémon cargado
      final updatedLoadedPokemon = Map<int, Pokemon>.from(state.loadedPokemon);
      updatedLoadedPokemon[int.parse(event.index)] = response;

      emit(state.copyWith(
        pokemonList: [...state.pokemonList, response],
        pokemonStatus: PokemonStatus.success,
        loadedPokemon: updatedLoadedPokemon,
      ));
    }
  }

  void _deleteFavPokemonData(DeletePokemon event, Emitter emit) {
    // Verificar si el Pokémon está en la lista de favoritos antes de eliminarlo
    if (state.favoritePokemon!.contains(event.pokemon)) {
      // Eliminar el Pokémon de la lista de favoritos
      List<Pokemon> updatedFavoritePokemonList =
          List.from(state.favoritePokemon!);
      updatedFavoritePokemonList.remove(event.pokemon);

      emit(state.copyWith(
        favoritePokemon: updatedFavoritePokemonList,
      ));
    }
  }

  void _addFavPokemonData(SavePokemon event, Emitter emit) {
    // Verificar si el Pokémon ya está en la lista de favoritos para evitar duplicados
    if (!state.favoritePokemon!.contains(event.pokemon)) {
      // Agregar el Pokémon a la lista de favoritos
      List<Pokemon> updatedFavoritePokemonList =
          List.from(state.favoritePokemon!);
      updatedFavoritePokemonList.add(event.pokemon);

      emit(state.copyWith(
        favoritePokemon: updatedFavoritePokemonList,
      ));
    }
  }

  @override
  PokemonState? fromJson(Map<String, dynamic> json) => PokemonState(
        pokemonList: json['pokemonList'] as List<Pokemon>,
        pokemonStatus: PokemonStatus.values[json['pokemonStatus'] as int],
        favoritePokemon: json['favoritePokemon'] as List<Pokemon>,
      );

  @override
  Map<String, dynamic>? toJson(PokemonState state) {
    return {
      'favoritePokemon': state.favoritePokemon,
      'pokemonList': state.pokemonList,
      'pokemonStatus': state.pokemonStatus.index
    };
  }
}
