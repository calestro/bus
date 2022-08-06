import 'package:bus/Compents/Search_Bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: const Text("Estação Livre"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink,
      ),
      body:SizedBox(
        width: wd,
        child: Column(
          children: [
            //espaçamento
            const SizedBox(height: 20),
            //search
            SearchBar(size: wd * 0.8),
            const SizedBox(height: 20),
            //Stream
            StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection("Bus").snapshots(),
                builder:(context, snapshot){

                return Container();
                },
            ),
            //bottom
          ],
        ),
      ),
    );
  }
}
