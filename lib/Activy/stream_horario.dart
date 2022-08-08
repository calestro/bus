import 'package:bus/Activy/description_activy.dart';
import 'package:bus/Compents/theme.dart';
import 'package:bus/Firebase/firebase_operations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HorarioList extends StatefulWidget {
  const HorarioList({Key? key}) : super(key: key);

  @override
  State<HorarioList> createState() => _HorarioListState();
}

int _selectPage = 0;
Map? map;

class _HorarioListState extends State<HorarioList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectPage = 0;
    });
  }
  @override
  Widget build(BuildContext context) {

    CallFirebase call = CallFirebase();
    MyStyle myStyle = MyStyle();

    if(map == null){
      setState((){_selectPage = 0;});
    }

    switch (_selectPage) {

      case 1:
        return DescriptionActivy(map: map!);

      default:
        return Column(
          children: [
            const SizedBox(height: 20,),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: call.streamFirebaseHorarios(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return ListView.builder(
                            itemCount: snapshot.data!.size,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  decoration: myStyle.boxTile,
                                  child: ListTile(
                                    title: Text(
                                        snapshot.data!.docs[index]["nome"],
                                        style: myStyle.title),
                                    onTap: () {
                                      map = call.busSelect(snapshot, index);
                                      setState(() {
                                        _selectPage = 1;
                                      });
                                    },
                                  ),
                                ),
                              );
                            }
                        );
                    }
                  }
              ),
            ),
          ],
        );
    }
  }
}
