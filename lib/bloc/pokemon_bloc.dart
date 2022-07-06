import 'package:http/http.dart' as http;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../class/pokemon.dart';

class PokemonBloc extends Bloc {
  Stream<List<Pokemon>>? streamPokemonList(int i) async* {
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
    yield pokemonList;
  }

  List<Pokemon> pokemonListFav = [];

  Future<List<Pokemon>>? pokemonListAddData(Pokemon? pokemon) async {
      pokemonListFav.add(Pokemon(
          id: pokemon!.id,
          name: pokemon.name,
          stats: pokemon.stats,
          sprites: pokemon.sprites,
          types: pokemon.types));
      return pokemonListFav;
    }

    Future<List<Pokemon>>? pokemonListShowData() async {
      List<Pokemon> pokemonListDataShow = [];
       pokemonListFav.forEach((pokemon) {
        pokemonListDataShow.add(
          Pokemon(
              id: pokemon.id,
              name: pokemon.name,
              stats: pokemon.stats,
              sprites: pokemon.sprites,
              types: pokemon.types
          )
        );
      });
      return pokemonListDataShow;
    }

    Future<List<Pokemon>>? pokemonListDeleteData(Pokemon pokemon) async {
      if (pokemonListFav.contains(pokemon)) {
        pokemonListFav.remove(pokemon);
        return pokemonListFav;
      }
     return pokemonListFav;
    }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  }
