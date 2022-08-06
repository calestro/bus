import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CallFirebase{

  streamFirebase(){

    return FirebaseFirestore.instance.collection("DIASUTEIS").where("HORARIO",arrayContains: 7).snapshots() ;
  }
}