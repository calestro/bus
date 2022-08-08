import 'dart:async';
import 'package:bus/Firebase/firebase_stream_home.dart';
import 'package:flutter/material.dart';




class MainActivy extends StatefulWidget {
  const MainActivy({Key? key}) : super(key: key);

  @override
  State<MainActivy> createState() => _MainActivyState();
}


class _MainActivyState extends State<MainActivy> {

  @override
  void initState() {
    super.initState();
    //cada minuto que passa e atz o stream
    Timer.periodic(const Duration(seconds: 40), (Timer t) {setState(() {});});
  }


  @override
  Widget build(BuildContext context) {

    var wd = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text("Estação Livre"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink,
      ),
      body:Column(
        children: [
          Container(
            color: Colors.pink,
            height: 120,
            width: wd,
          ),

          //Stream
          Expanded(
            child: Container
              (
              decoration: const BoxDecoration
                (
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft:  Radius.circular(20))
               ),
              child: const FirebaseStreamHome(),
            ),
          ),
        ],
      ),

    );
  }
}
