import 'package:http/http.dart' as http;
import '../class/pokemon.dart';
class PokemonBloc{
  Stream<List<Pokemon>>? streamPokemonList(int i) async* {
    i++;
    List<Pokemon> pokemonList = [];
    var url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$i/");
    var value = await http.get(url);
    final pokemonResquest = pokemonFromJson(value.body);
    pokemonList.add(Pokemon(
        name:pokemonResquest.name,
        id: pokemonResquest.id,
        stats: pokemonResquest.stats,
        sprites: pokemonResquest.sprites,
        types: pokemonResquest.types
    ));
    yield pokemonList;
  }
  Stream<List<Pokemon>> pokemonSavedFav(Pokemon? pokemones)async* {
    List<Pokemon> pokemonListFav = [];
    if(pokemones != null) {
      pokemonListFav.add(Pokemon(
          id: pokemones.id,
          name: pokemones.name,
          sprites: pokemones.sprites,
          types: pokemones.types,
          stats: pokemones.stats
      ));
      yield pokemonListFav;
    }
    yield pokemonListFav;
  }
}

