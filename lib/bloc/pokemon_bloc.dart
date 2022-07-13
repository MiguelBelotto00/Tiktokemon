import 'package:http/http.dart' as http;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../class/pokemon.dart';
List<Pokemon> _pokemonListAdd = [];
class PokemonBloc extends Bloc {
  Future<List<Pokemon>>? streamPokemonList(int i) async {
    i++;
    List<Pokemon> pokemonList = [];
    var url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$i/");
    var value = await http.get(url);
    final pokemonResquest = pokemonFromJson(value.body);
    pokemonList.add(Pokemon(
        name: pokemonResquest.name,
        id: pokemonResquest.id,
        stats: pokemonResquest.stats,
        sprites: pokemonResquest.sprites,
        types: pokemonResquest.types));
    return pokemonList;
  }

  void listAddData(Pokemon? pokemon) {
    if (_pokemonListAdd.isEmpty) {
      _pokemonListAdd.add(Pokemon(
        id: pokemon!.id,
        name: pokemon.name,
        types: pokemon.types,
        sprites: pokemon.sprites,
        stats: pokemon.stats,
      ));
    } else {
      var verify = _pokemonListAdd.any((element) => element.id == pokemon!.id);
      verify == true ? print("agregado") : _pokemonListAdd.add(Pokemon(
        id: pokemon!.id,
        name: pokemon.name,
        types: pokemon.types,
        sprites: pokemon.sprites,
        stats: pokemon.stats,
      ));

    }
    print(_pokemonListAdd.map((e) => e.name));
  }

  Stream<List<Pokemon>> getPokemon() async* {
    yield _pokemonListAdd;
  }

  void deletePokemonData(Pokemon? pokemon) {
    _pokemonListAdd.remove(pokemon);
    savePreferences();
    print(_pokemonListAdd.map((e) => e.name));
  }
  Future<void> savePreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String pokemonEncode = Pokemon.encode(_pokemonListAdd);
    print(pokemonEncode);
    await prefs.setString("pokemon_key", pokemonEncode);
  }

  Future<void> showPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String pokemonString = prefs.getString("pokemon_key").toString();
    final List<Pokemon> pokemonesDataDecode = Pokemon.decode(pokemonString);
    _pokemonListAdd = pokemonesDataDecode;
    print(pokemonesDataDecode);
    print(_pokemonListAdd);
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }
}
