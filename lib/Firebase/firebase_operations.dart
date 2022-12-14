import 'package:cloud_firestore/cloud_firestore.dart';

class CallFirebase {
  List busSearch = [];


  //Retorna Hora atual ou Minuto
   timeNow(String type){
    int h = DateTime.now().toLocal().hour;
    int m = DateTime.now().toLocal().minute;
     if(type == "m"){
      return m;
    }
    else if(type == "h"){
    return h;
    }

  return double.parse(h.toString() + "." + m.toString());

  }

  //retorna para o firebase os onibus com os horarios
  streamFirebaseHome() {

    var h = DateTime.now().toLocal().hour;
    var m = DateTime.now().toLocal().minute;

    busSearch.clear();

    addSearchBus(h, m);

    for (int i = 1; i < 10; i = i + 1) {
      m = m + 1;
      addSearchBus(h, m);
    }

    return FirebaseFirestore.instance
        .collection(dayReturns())
        .where("HORARIO", arrayContainsAny: busSearch)
        .snapshots();
  }

  //Retorna o dia para pesquisa no Firebase
  String dayReturns({bool isTomorrow = false}) {
    int day = DateTime.now().toLocal().weekday;
    if(isTomorrow = true){
      day + 1;
      if(day == 8){
        day = 1;
      }
    }
    switch (day) {
      case 6:
        {
          return "SABADO";
        }
      case 7:
        {
          return "DOMINGO";
        }
      default:
        {
          return "DIASUTEIS";
        }
    }
  }

  // adiciona as horas ao array de pesquisa
  addSearchBus(hours, minutes) {
    var mString = "";

    if (minutes >= 60) {
      minutes = minutes - 60;
      hours = hours + 1;
    }

    if (hours == 24) {
      hours = 0;
    }

    if (minutes.toString().length == 1) {
      mString = "0$minutes";
    } else {
      mString = minutes.toString();
    }

    busSearch.add("$hours.$mString");
  }

  // retorna a hora atual em double
  hourToComplete(hourNow, minuteNow) {
    if (minuteNow.toString().length == 2) {
      return double.parse("$hourNow.$minuteNow");
    } else {
      return double.parse("$hourNow.0$minuteNow");
    }
  }

  //retorna a hora + 10 min em double
  hourAdditing10(hourNow, minuteNow) {
    minuteNow = minuteNow + 10;
    if (minuteNow > 60) {
      minuteNow = minuteNow - 60;
      hourNow = hourNow + 1;
    }

    if (minuteNow.toString().length == 2) {
      return double.parse("$hourNow.$minuteNow");
    } else {
      return double.parse("$hourNow.0$minuteNow");
    }
  }

  //pesquisa a hora no array para exibir a hora certa e converte para exibi????o
  subHourHome(snapshot, index) {

    String? subtitleHours;

    snapshot.data!.docs[index]["HORARIO"].forEach((element) {
      if (double.parse(element) >=
              hourToComplete(DateTime.now().toLocal().hour,
                  DateTime.now().toLocal().minute) &&
          (double.parse(element) <=
              hourAdditing10(DateTime.now().toLocal().hour,
                  DateTime.now().toLocal().minute))) {

        if (subtitleHours != null) {
          subtitleHours = "${subtitleHours!} / $element";
        } else {
          subtitleHours = element.toString();
        }

        if (subtitleHours!.length == 4) {
          subtitleHours = "0$subtitleHours";
        }
      }
    });

    subtitleHours ??= "erro";
    return subtitleHours!.replaceAll(".", ":");

  }

  //retorna o stream da guia Horarios
  streamFirebaseHorarios(){
    return FirebaseFirestore.instance.collection(dayReturns()).snapshots();
  }

  //Abrir Pagina de Horarios Selecionado
  busSelect(snapshot, index) {
    Map map ={
      "nome":snapshot.data!.docs[index]["nome"],
      "reference":snapshot.data!.docs[index].id,
    };
    return map;
  }

  //retorna para o stream description
  streamFirebaseDescription(id,bool isTomorrow){
    print(isTomorrow);
    return FirebaseFirestore.instance.collection(dayReturns(isTomorrow: isTomorrow)).where("nome", isEqualTo: id).snapshots();

  }



}
