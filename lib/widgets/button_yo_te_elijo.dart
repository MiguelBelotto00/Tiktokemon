import 'package:flutter/material.dart';
class ButtonYoTeElijo extends StatefulWidget {
  const ButtonYoTeElijo({Key? key}) : super(key: key);

  @override
  State<ButtonYoTeElijo> createState() => _ButtonYoTeElijoState();
}

class _ButtonYoTeElijoState extends State<ButtonYoTeElijo> {
  @override
  Widget build(BuildContext context) {
    final _width= (MediaQuery.of(context).size.width * 0.8);
    final _height = (MediaQuery.of(context).size.height * 0.05);
    return InkWell(
      onTap: (){

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
          color: Colors.black,
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
    );
  }
}
