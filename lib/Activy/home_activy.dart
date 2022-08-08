import 'package:bus/Activy/stream_horario.dart';
import 'package:bus/Compents/theme.dart';
import 'package:bus/Activy/stream_home.dart';
import 'package:flutter/material.dart';




class MainActivy extends StatefulWidget {
  const MainActivy({Key? key}) : super(key: key);

  @override
  State<MainActivy> createState() => _MainActivyState();
}


class _MainActivyState extends State<MainActivy> {


  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[

    FirebaseStreamHome(),
    HorarioList(),
    Text(
      'Page 2',
    ),


  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    MyStyle myStyle = MyStyle();

    //Pergunta ao usuário se ele realmente quer sair
    Future<bool> onTap() async{
      return await showDialog(
        context: context,
        builder: (context) =>AlertDialog(
          title:const Text('Sair do App'),

          content:const Text('Você quer sair do App ?'),

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

    return WillPopScope(
      onWillPop: onTap,
      child: Scaffold(
        backgroundColor: Colors.pink,
        appBar:myStyle.appBar,
        body:Container(
          decoration: myStyle.boxMain,
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
  bottomNavigationBar: BottomNavigationBar(
      items:
      const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.bus_alert), label: "Horários"),
        BottomNavigationBarItem(icon: Icon(Icons.help_rounded), label: "3"),
      ],
      backgroundColor: Colors.grey[200],
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.pink,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
  ),
      ),
    );
  }
}
