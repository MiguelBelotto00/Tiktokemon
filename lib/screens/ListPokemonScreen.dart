import 'package:flutter/material.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';

import '../class/pokemon.dart';
class ListPokemonScreen extends StatefulWidget{
  final Pokemon? pokemon;
  const ListPokemonScreen({Key? key, this.pokemon}) : super(key: key);
  @override
  State<ListPokemonScreen> createState() => _ListPokemonScreen();
}

class _ListPokemonScreen extends State<ListPokemonScreen>{
  late final pokemonBloc = PokemonBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(25),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_outlined,color: Colors.black,size: 40.0,)),
                  Expanded(child: Container()),
                  const Text("Mis Favoritos",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,),textAlign: TextAlign.end,)
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.81,
                color: Colors.red,
                child: StreamBuilder<List<Pokemon>>(stream: pokemonBloc.pokemonSavedFav(widget.pokemon),
                  builder: (context,snapshot){
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.active:
                      case ConnectionState.done:
                        return pokemonShowDataFav(snapshot.data);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
Widget pokemonShowDataFav(List<Pokemon>? pokemons){
  return ListView(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    children: pokemons!.map((pokemones){
      return ListView(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(pokemones.sprites!.other!.home!.frontDefault))
            ),
          ),
          Text(pokemones.name.toString()),
          IconButton(icon: Icon(Icons.delete),color: Colors.white,onPressed: (){},),
        ],
      );
    }).toList(),
  );
}

