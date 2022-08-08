import 'package:flutter/material.dart';


class MyStyle{

  //Text Style
  final TextStyle advertion = const TextStyle(color: Colors.red);
  final TextStyle title = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final TextStyle subtitle = const TextStyle(color: Colors.amber, fontSize: 19);


//BoxDecoration
final BoxDecoration boxMain = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20)
    )
);

}