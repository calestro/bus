import 'dart:async';
import 'package:bus/Compents/theme.dart';
import 'package:bus/Firebase/firebase_home_activy.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseStreamHome extends StatefulWidget {
  const FirebaseStreamHome({Key? key}) : super(key: key);

  @override
  State<FirebaseStreamHome> createState() => _FirebaseStreamHomeState();
}

class _FirebaseStreamHomeState extends State<FirebaseStreamHome> {

  @override
  void initState() {
    super.initState();
    //cada minuto que passa e atz o stream
    Timer.periodic(const Duration(seconds: 40), (Timer t) {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {

    CallFirebase call = CallFirebase();
    MyStyle myStyle = MyStyle();

    return Column(
      children: [
        const SizedBox(height: 10),
        Center(
          child: Text(" * Todos os horários são estimados",
              style: myStyle.advertion),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: call.streamFirebase(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  //Testando Conexão
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    // retorno da Stream para Grid
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GridTile(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFFaf164a),
                                  width: 3.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                            snapshot.data!.docs[index]["nome"],
                                            style: myStyle.title,
                                            textAlign: TextAlign.center),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                              call
                                                  .subtitleHour(snapshot, index)
                                                  .toString(),
                                              style: myStyle.subtitle),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                }
              }),
        ),
      ],
    );
  }
}
