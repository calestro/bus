import 'dart:async';

import 'package:bus/Compents/Search_Bar.dart';
import 'package:bus/Firebase/firebase_home_activy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class MainActivy extends StatefulWidget {
  const MainActivy({Key? key}) : super(key: key);

  @override
  State<MainActivy> createState() => _MainActivyState();
}


class _MainActivyState extends State<MainActivy> {


  void initState() {
    super.initState();
    //cada minuto que passa e atz o stream
    Timer(Duration(seconds: 60), () {setState(() {print("reload");});});
  }


  @override
  Widget build(BuildContext context) {

    var wd = MediaQuery.of(context).size.width;

    //Classe responsável por armazenar operações do Firebase
    CallFirebase call = CallFirebase();


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
              stream:call.streamFirebase(),
                builder:(context, snapshot) {
                  switch (snapshot.connectionState) {   //Testando Conexão
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.size,
                          itemBuilder: (context, index) {

                            var subtitleHours;
                            snapshot.data!.docs[index]["HORARIO"].forEach((element) {
                            if(double.parse(element) > call.hourToComplete(DateTime.now().hour,DateTime.now().minute)
                                && (double.parse(element) < call.houradditing10(DateTime.now().hour,DateTime.now().minute))){
                              if(subtitleHours != null){subtitleHours = subtitleHours +  " " + element.toString();}
                              else {
                                subtitleHours = element.toString();
                              }
                            }

                            });

                            return ListTile(
                              title: Text(snapshot.data!.docs[index]["nome"]),
                              subtitle: Text(subtitleHours),
                            );
                          },
                        ),
                      );
                  }
                }
            ),
            //bottom
          ],
        ),
      ),
    );
  }
}
