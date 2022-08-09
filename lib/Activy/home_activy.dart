import 'package:bus/Activy/Info_Activy.dart';
import 'package:bus/Activy/stream_horario.dart';
import 'package:bus/Compents/theme.dart';
import 'package:bus/Activy/stream_home.dart';
import 'package:flutter/material.dart';

import '../Compents/pop_up_exit.dart';

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
    InfoActivy(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    MyStyle myStyle = MyStyle();

    return WillPopScope(
      onWillPop: () => reallyExit(context),
      child: Scaffold(
        backgroundColor: Colors.pink,
        appBar: myStyle.appBar,
        body: Container(
          decoration: myStyle.boxMain,
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bus_alert), label: "Horários"),
            BottomNavigationBarItem(
                icon: Icon(Icons.help_rounded), label: "Informações"),
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
