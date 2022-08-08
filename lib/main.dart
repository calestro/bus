import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Activy/mainactivy.dart';
import 'Firebase/firebase_options.dart';



void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  teste();
  runApp(const MaterialApp(
    home: MainActivy(),
  ));

}

void teste(){
print(DateTime.now().toLocal().weekday);
}
