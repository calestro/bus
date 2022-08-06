import 'package:flutter/material.dart';


class SearchBar extends StatelessWidget {
  final size;
  const SearchBar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: TextField(

        decoration: InputDecoration(
          label: Text("Pesquisar"),
        ),
      ),
    );
  }
}
