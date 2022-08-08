import 'dart:async';
import 'package:bus/Compents/theme.dart';
import 'package:bus/Firebase/firebase_operations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseStreamHome extends StatefulWidget {
  const FirebaseStreamHome({Key? key}) : super(key: key);

  @override
  State<FirebaseStreamHome> createState() => _FirebaseStreamHomeState();
}

class _FirebaseStreamHomeState extends State<FirebaseStreamHome> {
Timer? _timer;
  @override
  void initState() {
    super.initState();
    //cada minuto que passa e atz o stream
    _timer =Timer.periodic(const Duration(seconds: 40), (Timer t) {setState(() {});});
  }
  @override
  void dispose() {
    // quando widget morre o timer e cancelado
    _timer!.cancel();
    // TODO: implement dispose
    super.dispose();
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
              stream: call.streamFirebaseHome(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  //Testando Conexão
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.none:
                    return const Center(
                      child: Text("Sem Internet")
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
                              decoration: myStyle.boxTile,
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
                                                  .subHourHome(snapshot, index)
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
