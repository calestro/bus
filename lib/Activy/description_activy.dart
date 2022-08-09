import 'package:bus/Compents/theme.dart';
import 'package:bus/Firebase/firebase_operations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DescriptionActivy extends StatefulWidget {
  const DescriptionActivy({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  State<DescriptionActivy> createState() => _DescriptionActivyState();
}

class _DescriptionActivyState extends State<DescriptionActivy> {
  bool isTomorrow = false;
  @override
  Widget build(BuildContext context) {
    CallFirebase call = CallFirebase();
    MyStyle myStyle = MyStyle();

    return Scaffold(
      appBar: myStyle.appBar,
      backgroundColor: Colors.pink,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: myStyle.boxMain,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 20),
            Text(widget.map["nome"], style: myStyle.titleBus),
            // Carrousel
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey.shade100,
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () => setState(() => isTomorrow = !isTomorrow),
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                   isTomorrow ? Text("Amanhã", style: myStyle.titleBus, textAlign: TextAlign.center) : Text("Hoje", style: myStyle.titleBus, textAlign: TextAlign.center),
                  IconButton(
                    onPressed: () => setState(() => isTomorrow = !isTomorrow),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            //lista de Horarios
            Container(
              height: 74,
              color: Colors.grey.shade200,
              child: StreamBuilder<QuerySnapshot>(
                  stream: call.streamFirebaseDescription(
                      widget.map["nome"], isTomorrow),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs[0]["HORARIO"].length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: 100,
                              decoration: myStyle.boxTile,
                              child: Center(
                                child: ListTile(
                                  title: Text(
                                    snapshot.data!.docs[0]["HORARIO"][index].replaceAll(".", ":"),
                                    style: myStyle.title,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }),
            ),
          Container(
            height: 12,
            color: Colors.grey.shade100,
          ),
          ],
        ),
      ),
    );
  }
}
