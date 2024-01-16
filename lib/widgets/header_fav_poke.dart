import 'package:flutter/material.dart';
import 'package:tiktokemon/class/class.dart';

class HeaderFavPokemon extends StatefulWidget {
  final Pokemon? pokemon;
  final Color colors;
  const HeaderFavPokemon(
      {super.key, required this.pokemon, required this.colors});

  @override
  State<HeaderFavPokemon> createState() => _HeaderFavPokemonState();
}

class _HeaderFavPokemonState extends State<HeaderFavPokemon> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.3;
    return FittedBox(
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/list_pokemon_screens');
              },
              child: Container(
                padding: const EdgeInsets.only(top: 45.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Mis Favoritos",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.1,
                          fontWeight: FontWeight.w300),
                    ),
                    Icon(
                      Icons.favorite_border_sharp,
                      color: Colors.white,
                      size: height * 0.15,
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pokemon nro ${widget.pokemon!.id}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.1,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        widget.pokemon!.name.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.15,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
