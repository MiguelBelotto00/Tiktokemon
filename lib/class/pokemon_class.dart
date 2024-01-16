import 'dart:convert';

import 'package:tiktokemon/class/class.dart';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.id, // se recibe
    this.name, // se recibe
    this.sprites, // se recibe
    this.stats, // se recibe
    this.types, // se recibe
  });
  int? id;
  String? name;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sprites": sprites!.toJson(),
        "stats": List<dynamic>.from(stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(types!.map((x) => x.toJson())),
      };

  static Map<String, dynamic> toMap(Pokemon pokemon) => {
        "id": pokemon.id,
        "name": pokemon.name,
        "sprites": pokemon.sprites!.toJson(),
        "stats": List<dynamic>.from(pokemon.stats!.map((x) => x.toJson())),
        "types": List<dynamic>.from(pokemon.types!.map((x) => x.toJson())),
      };

  static String encode(List<Pokemon> pokemones) => json.encode(
        pokemones.map<Map<String, dynamic>>((poke) {
          if (poke.id != null) {
            return Pokemon.toMap(poke);
          } else {
            return {};
          }
        }).toList(),
      );

  static List<Pokemon> decode(String pokemon) =>
      (json.decode(pokemon) as List<dynamic>)
          .map<Pokemon>((poke) => Pokemon.fromJson(poke))
          .toList();
}
