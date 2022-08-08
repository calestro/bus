import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final double size;
  const SearchBar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: const TextField(
        //controller..
        cursorColor: Colors.white,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.pink,
              width: 2.0,
            ),
          ),
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(20)),
           borderSide: BorderSide(
             color: Colors.pink,
             width: 2.0
           ),
         ),
          label: Text("Pesquisar", style: TextStyle(color: Colors.pink)),
          fillColor: Colors.pink,
          ),
        ),
      );
  }
}
