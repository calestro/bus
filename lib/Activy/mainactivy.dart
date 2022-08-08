import 'dart:async';
import 'package:bus/Firebase/firebase_home_activy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    Timer(const Duration(seconds: 60), () {setState(() {});});
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
            //Stream
            StreamBuilder<QuerySnapshot>(
              stream:call.streamFirebase(),
                builder:(context, snapshot) {
                  switch (snapshot.connectionState) {   //Testando Conexão
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const Expanded(
                        child:  Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    default:
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemCount: snapshot.data!.size,
                          itemBuilder: (context, index) {

                            String? subtitleHours;
                            snapshot.data!.docs[index]["HORARIO"].forEach((element) {
                            if(double.parse(element) > call.hourToComplete(DateTime.now().toLocal().hour,DateTime.now().toLocal().minute)
                                && (double.parse(element) < call.houradditing10(DateTime.now().toLocal().hour,DateTime.now().toLocal().minute))){
                              if(subtitleHours != null){subtitleHours = "${subtitleHours!} / $element";}
                              else {
                                subtitleHours = element.toString();
                              }
                            }

                            });

                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: GridTile(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(snapshot.data!.docs[index]["nome"],style: TextStyle(color: Colors.white),),
                                    subtitleHours != null ? Text(subtitleHours!,style: TextStyle(color: Colors.white),) : const Text(""),
                                  ],
                                ),
                                ),

                              ),
                            );
                          },
                        ),
                      );
                  }
                }
            ),
          ],
        ),
      ),

    );
  }
}
