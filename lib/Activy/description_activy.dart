import 'package:flutter/material.dart';


class DescriptionActivy extends StatelessWidget {
  const DescriptionActivy({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Text(map["nome"])
          ),

        ],
      ),
    );
  }
}
