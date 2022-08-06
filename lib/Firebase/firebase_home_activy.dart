import 'package:bus/Globals/Global_hours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CallFirebase{

  streamFirebase(){

    var hourNow = DateTime.now().hour;
    var minuteNow = DateTime.now().minute;



    //Criando Lista  para procurar onibus
    List busSearch = [];

    //Adicionando todos os onibus nos proximos 10 min dentro do Array
    for (int i = 1; i < 10 ;i = i + 1) {


      var h = hourNow;
      var m = minuteNow;
      var mString = "";

      //adicionando + 1 minuto no intervalo de 10 vezes
      m = m + i;

      //caso os minutos deem 60 ele zera os minutos e add +1 na hora
      if(m == 60){
        m = 0;
        h = h + 1;
      }

      //caso o minutos so tenha uma casa ele add + um 0 e converte minutos para string
      if(m.toString().length == 1){
        mString = "0" + m.toString();
      }
      //caso ele tenha 2 casas ele so converte para string
      else{
        mString = m.toString();
      }

      // a conversao total e string para procura + adição no array
      var hoursString = h.toString() + "." + mString;
      busSearch.add(hoursString);
    }
    print(busSearch);

    //retornando pro Firebase
    return FirebaseFirestore.instance.collection("DIASUTEIS").where("HORARIO", arrayContainsAny: busSearch).snapshots();
  }
}