import 'package:flutter/material.dart';


class MyStyle{

  //Text Style
  final TextStyle advertion = const TextStyle(color: Colors.red);
  final TextStyle title = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final TextStyle subtitle = const TextStyle(color: Colors.amber, fontSize: 19, fontWeight: FontWeight.bold);


//BoxDecoration Background
final BoxDecoration boxMain = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20)
    )
);

final BoxDecoration boxTile = BoxDecoration(
  color: Colors.pinkAccent,
  borderRadius:BorderRadius.circular(20),
  border: Border.all(
    color: const Color(0xFFaf164a),
    width: 3.0,
    style: BorderStyle.solid,
  ),
);

}