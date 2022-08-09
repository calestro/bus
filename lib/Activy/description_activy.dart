import 'package:bus/Compents/theme.dart';
import 'package:flutter/material.dart';


class DescriptionActivy extends StatelessWidget {
  const DescriptionActivy({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  Widget build(BuildContext context) {

    MyStyle myStyle = MyStyle();


    return Scaffold(
      appBar:myStyle.appBar,
      backgroundColor: Colors.pink,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: myStyle.boxMain,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 20),
            Text(map["nome"], style:myStyle.subtitle),
            // Carrousel

            //


            ]
        ),
        ),
      );
  }

}
