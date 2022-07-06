import 'package:flutter/material.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';
import 'package:tiktokemon/class/pokemon.dart';
import 'package:tiktokemon/widgets/container_stack_data.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pokemonBloc = PokemonBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           body: PageView.builder(
               physics: const BouncingScrollPhysics(),
               scrollDirection: Axis.vertical,
             itemBuilder: (context,index) {
              return StreamBuilder<List<Pokemon>>(
                   stream: pokemonBloc.streamPokemonList(index),
                   builder: (context, snapshot) {
                     switch (snapshot.connectionState) {
                       case ConnectionState.none:
                       case ConnectionState.waiting:
                         return Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.white,
                                Colors.red
                              ],stops: [0.5,0.5],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                            ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: const [
                                 CircularProgressIndicator(color: Colors.yellow,backgroundColor: Colors.red,),
                                 Text("Pokemon en Camino...",style: TextStyle(color: Colors.yellow,fontSize: 20.0,fontWeight: FontWeight.w800),)
                               ],
                             ));
                       case ConnectionState.active:
                       case ConnectionState.done:
                         return pokemonShowData(snapshot.data);
                     }
                   }
               );
             }),
      ),
    );
  }
}

Widget pokemonShowData(List<Pokemon>? pokemons){
  return Flexible(
        child: PageView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: pokemons!.map((pokemones){
              return ContainerStackData(pokemon: pokemones,);
            }).toList(),
          ),
  );
}