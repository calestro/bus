

class GlobalHours{
  static final GlobalHours _globalHours = GlobalHours._internal();
  factory GlobalHours(){
    return _globalHours;
  }
  GlobalHours._internal();



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