import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Activy/mainactivy.dart';
import 'firebase_options.dart';



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


}
