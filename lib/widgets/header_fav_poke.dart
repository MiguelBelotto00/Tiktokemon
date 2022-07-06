import 'package:flutter/material.dart';
import 'package:tiktokemon/screens/ListPokemonScreen.dart';
import '../class/pokemon.dart';
class HeaderFavPokemon extends StatefulWidget {
  late Pokemon? pokemon;
  final MaterialColor colors;
  HeaderFavPokemon({Key? key, required this.pokemon, required this.colors}) : super(key: key);

  @override
  State<HeaderFavPokemon> createState() => _HeaderFavPokemonState();
}

class _HeaderFavPokemonState extends State<HeaderFavPokemon> {
  @override
  Widget build(BuildContext context) {
    final _widt = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height*0.25;
    return FittedBox(
      child: SizedBox(
        width: _widt,
        height: _height,
        child: Column(
          children: [
            InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListPokemonScreen()));
              },
              child: Container(
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
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0,top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pokemon nro ${widget.pokemon!.id}",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.w300),),
                      Text(widget.pokemon!.name.toString(),style: TextStyle(color: Colors.white,fontSize:40.0,fontWeight: FontWeight.w600),)
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
