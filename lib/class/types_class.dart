import 'package:tiktokemon/class/species_class.dart';

class Type {
  Type({
    this.slot,
    this.type,
  });

  int? slot;
  Species? type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type!.toJson(),
      };
}
