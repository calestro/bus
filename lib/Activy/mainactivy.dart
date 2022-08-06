import 'package:bus/Compents/Search_Bar.dart';
import 'package:flutter/material.dart';


class MainActivy extends StatefulWidget {
  const MainActivy({Key? key}) : super(key: key);

  @override
  State<MainActivy> createState() => _MainActivyState();
}

class _MainActivyState extends State<MainActivy> {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    var hg = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Estação Livre"),
        centerTitle: true,
      ),
      body:Container(
        width: wd,
        child: Column(
          children: [
            //search
            SearchBar(size: wd * 0.8),
            //Stream
            //bottom
          ],
        ),
      ),
    );
  }
}
