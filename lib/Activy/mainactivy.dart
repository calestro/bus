import 'dart:async';
import 'package:bus/Firebase/firebase_stream_home.dart';
import 'package:flutter/material.dart';




class MainActivy extends StatefulWidget {
  const MainActivy({Key? key}) : super(key: key);

  @override
  State<MainActivy> createState() => _MainActivyState();
}


class _MainActivyState extends State<MainActivy> {

  @override
  void initState() {
    super.initState();
    //cada minuto que passa e atz o stream
    Timer.periodic(const Duration(seconds: 40), (Timer t) {setState(() {});});
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[

    FirebaseStreamHome(),

    Text(
      'Page 1',
    ),
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

    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text("Estação Livre"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink,
      ),
      body:Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //Stream
          Expanded(
            flex: 1,
            child: Container
              (
              decoration: const BoxDecoration
                (
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft:  Radius.circular(20))
               ),
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
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
    );
  }
}
