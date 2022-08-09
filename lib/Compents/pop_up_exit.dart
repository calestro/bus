import 'package:flutter/material.dart';


//Pergunta ao usuário se ele realmente quer sair
Future<bool> reallyExit (context) async {

  return await showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Sair do App'),

            content: const Text('Você quer sair do App ?'),

            actions: <Widget>[

              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: const Text("SIM"),
              ),

              const SizedBox(height: 16),

              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                // ignore: prefer_const_constructors
                child: Text("NÃO"),
              ),
            ],
          ),
    ) ?? false;
  }
