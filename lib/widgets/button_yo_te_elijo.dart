import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';
import 'package:tiktokemon/class/pokemon_class.dart';

class ButtonYoTeElijo extends StatefulWidget {
  final Pokemon? pokemon;
  const ButtonYoTeElijo({super.key, this.pokemon});
  @override
  State<ButtonYoTeElijo> createState() => _ButtonYoTeElijoState();
}

class _ButtonYoTeElijoState extends State<ButtonYoTeElijo> {
  void functionVoidOnTap() {
    context.read<PokemonBloc>().add(
          SavePokemon(pokemon: widget.pokemon!),
        );
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
      "Agregaste a tus favoritos",
      style: TextStyle(color: Colors.white),
    )));
  }

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width * 0.8);
    final height = (MediaQuery.of(context).size.height * 0.05);
    return InkWell(
      onTap: functionVoidOnTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: const Text(
          "Yo te Elijo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
