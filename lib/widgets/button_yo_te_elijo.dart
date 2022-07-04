import 'package:flutter/material.dart';
import 'package:tiktokemon/bloc/pokemon_bloc.dart';
import 'package:tiktokemon/class/pokemon.dart';

import '../screens/ListPokemonScreen.dart';
class ButtonYoTeElijo extends StatefulWidget {
  final Pokemon? pokemon;
  ButtonYoTeElijo({Key? key,this.pokemon}) : super(key: key);
  @override
  State<ButtonYoTeElijo> createState() => _ButtonYoTeElijoState();
}

class _ButtonYoTeElijoState extends State<ButtonYoTeElijo> {
  @override
  Widget build(BuildContext context) {
    final _width= (MediaQuery.of(context).size.width * 0.8);
    final _height = (MediaQuery.of(context).size.height * 0.05);
    const bool colors = true;
    return Container(
      child: InkWell(
        focusColor: Colors.grey,
        onTap: () {
          ListPokemonScreen(pokemon: widget.pokemon);
          colors != false;
        },
        child: Container(
          margin: const EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
            bottom: 20.0
          ),
          height: _height,
          width: _width,
          decoration: const BoxDecoration(
            color: colors == true ? Colors.black: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: const Center(
            child: Text(
              "Yo te elijo !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
