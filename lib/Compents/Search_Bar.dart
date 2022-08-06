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

        decoration: InputDecoration(
          label: Text("Pesquisar"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topRight:Radius.circular(20)),
            borderSide: BorderSide(
              color:Colors.pink,
            )
          )


        ),
      ),
    );
  }
}
