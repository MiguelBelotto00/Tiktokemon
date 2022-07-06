import 'package:flutter/material.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';
import '../class/pokemon.dart';
class ListPokemonScreen extends StatefulWidget{
  const ListPokemonScreen({Key? key,}) : super(key: key);
  @override
  State<ListPokemonScreen> createState() => _ListPokemonScreen();
}

class _ListPokemonScreen extends State<ListPokemonScreen>{
  PokemonBloc pokemonBloc = PokemonBloc();
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
                child: StreamBuilder<List<Pokemon>>(
                  stream: pokemonBloc.streamPokemonList(2),
                  builder: (context,snapshot){
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if(snapshot.hasData != null) {
                          return pokemonShowDataFav(snapshot.data);
                        }else{
                          return Center(child: const CircularProgressIndicator(),);
                        }
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
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          color: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(pokemones.sprites!.other!.home!.frontDefault))
              ),
            ),
            Text(pokemones.name.toString(),style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
              color: Colors.white
            ),),
            IconButton(icon: Icon(Icons.delete),color: Colors.white,onPressed: (){},)
          ],
        ),
      );}).toList(),
  );
}

