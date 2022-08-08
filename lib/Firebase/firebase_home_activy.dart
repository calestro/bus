import 'package:cloud_firestore/cloud_firestore.dart';


class CallFirebase{

  streamFirebase(){

    //Criando Lista  para procurar onibus
    List busSearch = [];
    //pega a hora e minuto atuais
    var h= DateTime.now().toLocal().hour;
    var m = DateTime.now().toLocal().minute;

    //Adicionando todos os onibus nos proximos 10 min dentro do Array
    for (int i = 1; i < 10 ;i = i + 1) {

      // variavel que converte double para string para realizar tratamentos
      var mString = "";

      //adicionando + 1 minuto no intervalo de 10 vezes
      m = m + 1;

      //caso os minutos deem 60 ele zera os minutos e add +1 na hora
      if(m == 60){
        m = 0;
        h = h + 1;
      }
      //caso a hora for = 24 ele zera a hora
      if(h == 24){
        h=0;
      }


      //caso o minutos so tenha uma casa ele add + um 0 e converte minutos para string
      if(m.toString().length == 1){
        mString = "0$m";
      }
      //caso ele tenha 2 casas ele so converte para string
      else{
        mString = m.toString();
      }

      // a conversao total + adição no array
      busSearch.add("$h.$mString");
    }

    //retornando pro Firebase
    return FirebaseFirestore.instance.collection("DIASUTEIS").where("HORARIO", arrayContainsAny: busSearch).snapshots();
  }

  hourToComplete(hourNow, minuteNow){

    if(minuteNow.toString().length == 2) {
      return double.parse("$hourNow.$minuteNow");
    }
    else{
      return double.parse("$hourNow.0$minuteNow");
    }

  }

  houradditing10(hourNow, minuteNow){
    minuteNow = minuteNow + 10;
    if(minuteNow  > 60){
      minuteNow = minuteNow  - 60;
      hourNow = hourNow + 1;
    }

    if(minuteNow.toString().length == 2) {
      return double.parse("$hourNow.$minuteNow");
    }
    else{
      return double.parse("$hourNow.0$minuteNow");
    }

  }




}


