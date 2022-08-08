import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Activy/home_activy.dart';
import 'Firebase/firebase_options.dart';



void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: MainActivy(),
  ));

}

