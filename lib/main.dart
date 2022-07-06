import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:tiktokemon/screens/ListPokemonScreen.dart';
import 'package:tiktokemon/screens/home_page.dart';

import 'bloc/pokemon_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: PokemonBloc(),
      child: MaterialApp(
        title: 'TikTokemon',
        initialRoute: 'home_page',
        routes: {
          'home_page': (BuildContext context) => const HomePage(),
          'list_pokemon_screens': (BuildContext context)=> const ListPokemonScreen(),
        },
      ),
    );
  }
}
