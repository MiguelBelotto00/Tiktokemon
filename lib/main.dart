import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tiktokemon/class/class.dart';
import 'package:tiktokemon/screens/ListPokemonScreen.dart';
import 'package:tiktokemon/screens/home_page.dart';
import 'package:tiktokemon/services/network_service.dart';

import 'bloc/pokemon_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonBloc>(
      create: (context) => PokemonBloc(
        PokemonState(pokemonList: <Pokemon>[]),
        NetworkServices(),
      ),
      child: MaterialApp(
        title: 'TikTokemon',
        initialRoute: 'home_page',
        routes: {
          'home_page': (BuildContext context) => const HomePage(),
          '/list_pokemon_screens': (BuildContext context) =>
              const ListPokemonScreen(),
        },
      ),
    );
  }
}
