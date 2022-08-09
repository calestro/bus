import 'package:flutter/material.dart';


class InfoActivy extends StatefulWidget {
  const InfoActivy({Key? key}) : super(key: key);

  @override
  State<InfoActivy> createState() => _InfoActivyState();
}

class _InfoActivyState extends State<InfoActivy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height:20),
          Text("Informações"),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Git Hub "),
              Text("Linkendin "),
              Text("Facebook "),
            ],
          ),

          Text("Desenvolvedor: Leonir Jùnior Ribeiro Calestro"),


        ],
      ),
    );
  }
}
