import 'package:tiktokemon/class/species_class.dart';

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Species? stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat!.toJson(),
      };
}
