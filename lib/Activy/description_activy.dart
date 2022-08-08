import 'package:bus/Compents/theme.dart';
import 'package:flutter/material.dart';


class DescriptionActivy extends StatelessWidget {
  const DescriptionActivy({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  Widget build(BuildContext context) {

    MyStyle myStyle = MyStyle();


    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(map["nome"], style:myStyle.subtitle,)
              ),

          ),

        ],
      ),
    );
  }

}
