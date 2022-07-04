import 'package:flutter/material.dart';
import 'package:tiktokemon/screens/ListPokemonScreen.dart';
import 'package:tiktokemon/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTokemon',
      initialRoute: 'home_page',
      routes: {
        'home_page': (BuildContext context) => const HomePage(),
        'list_pokemon_screens': (BuildContext context)=> const ListPokemonScreen(),
      },
    );
  }
}
