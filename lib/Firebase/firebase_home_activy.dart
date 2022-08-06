import 'package:bus/Globals/Global_hours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CallFirebase{

  streamFirebase(){

    //Criando Lista  para procurar onibus
    List busSearch = [];

    //Adicionando todos os onibus nos proximos 10 min dentro do Array
    for (int i = 1; i < 10 ;i = i + 1) {

      //pega a hora e minuto atuais
      var h= DateTime.now().hour;
      var m = DateTime.now().minute;

      // variavel que converte double para string para realizar tratamentos
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

      // a conversao total + adição no array
      busSearch.add(h.toString() + "." + mString);
    }

    //retornando pro Firebase
    return FirebaseFirestore.instance.collection("DIASUTEIS").where("HORARIO", arrayContainsAny: busSearch).snapshots();
  }

  hourToComplete(hourNow, minuteNow){

    if(minuteNow.toString().length == 2) {
      return double.parse(hourNow.toString() + "." + minuteNow.toString());
    }
    else{
      return double.parse(hourNow.toString() + "." + "0"+ minuteNow.toString());
    }

  }

  houradditing10(hourNow, minuteNow){
    minuteNow = minuteNow + 10;
    if(minuteNow  > 60){
      minuteNow = minuteNow  - 60;
      hourNow = hourNow + 1;
    }

    if(minuteNow.toString().length == 2) {
      return double.parse(hourNow.toString() + "." + minuteNow.toString());
    }
    else{
      return double.parse(hourNow.toString() + "." + "0"+ minuteNow.toString());
    }

  }




}


