import 'package:flutter/material.dart';
class HeaderFavPokemon extends StatefulWidget {
  const HeaderFavPokemon({Key? key}) : super(key: key);

  @override
  State<HeaderFavPokemon> createState() => _HeaderFavPokemonState();
}

class _HeaderFavPokemonState extends State<HeaderFavPokemon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 45.0,right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text("Mis Favoritos",style: TextStyle(
                color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.w300
              ),),
              Icon(Icons.favorite_border_sharp,color: Colors.white,size: 40.0,)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15.0,top: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pokemon nro 5",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.w300),),
                  Text("Charmeleon",style: TextStyle(color: Colors.white,fontSize:40.0,fontWeight: FontWeight.w600),)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
