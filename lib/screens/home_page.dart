import 'package:flutter/material.dart';
import 'package:tiktokemon/widgets/container_card.dart';
import 'package:tiktokemon/widgets/header_fav_poke.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           body: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.orange,
                child: Stack(children: [
                  HeaderFavPokemon(),
                  const ContainerCard(),
                  Container(
                    margin: EdgeInsets.only(top: 200.0,right: 30.0,left: 30.0),
                    child: Image(image: NetworkImage(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/5.png"
                    ),width: 340.0,height: 340.0,),
                  )
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.green,
                child: Stack(children: [
                  HeaderFavPokemon(),
                  const ContainerCard(),
                  Container(
                    margin: EdgeInsets.only(top: 200.0,right: 30.0,left: 30.0),
                    child: Image(image: NetworkImage(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png"
                    ),width: 340.0,height: 340.0,),
                  )
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.blue,
                child: Stack(children: [
                  HeaderFavPokemon(),
                  const ContainerCard(),
                  Container(
                    margin: EdgeInsets.only(top: 200.0,right: 30.0,left: 30.0),
                    child: Image(image: NetworkImage(
                        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/8.png"
                    ),width: 340.0,height: 340.0,),
                  )
                ]),
              ),
          ]
        ),
      ),
    );
  }
}
