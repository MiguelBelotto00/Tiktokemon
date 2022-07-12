import 'package:http/http.dart' as http;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../class/pokemon.dart';
final List<Pokemon> _pokemonListAdd = [];
final List<Pokemon> pokemonGet = _pokemonListAdd;
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
  void listAddData(Pokemon? pokemon){
     if(_pokemonListAdd.contains(pokemon) == true){
       print("Agregado");
     }else{
       _pokemonListAdd.add(Pokemon(
         id: pokemon!.id,
         name: pokemon.name,
         types: pokemon.types,
         sprites: pokemon.sprites,
         stats: pokemon.stats,
       ));
       print(_pokemonListAdd.map((e) => e.name));
     }
  }

  Stream<List<Pokemon>> getPokemon() async* {
    yield pokemonGet;
  }

  void deletePokemonData(Pokemon? pokemon){
    _pokemonListAdd.remove(pokemon);
    print(_pokemonListAdd.map((e)=> e.name) );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}




