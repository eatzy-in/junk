import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selling_meter_app/app.dart';
import 'package:selling_meter_app/scrollBar.dart';

import 'authentication/AuthService.dart';
import 'homePage.dart';

class ControllerWidget extends StatefulWidget {
  const ControllerWidget({Key? key}) : super(key: key);

  @override
  State<ControllerWidget> createState() => _ControllerWidgetState();
}

class _ControllerWidgetState extends State<ControllerWidget> {
  static FirebaseAuth auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const FirstRoute(),
    const SecondRoute(),
    const SecondRoute(),
  ];

  static final List<Color> _backGroundColor = <Color>[
    Colors.blueAccent,
    Colors.indigo,
    Colors.deepOrangeAccent,
    Colors.teal
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Auth().signOutAndRedirectToHomePage(context);
                    },
                    child: const Icon(
                      Icons.logout,
                      size: 26.0,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.more_vert),
                  )),
            ],
            title: const Text("The Royal Phular",
                style: TextStyle(color: Colors.white))),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blueAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Menu',
                backgroundColor: Colors.indigo),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Business',
                backgroundColor: Colors.cyan),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'Logout',
                backgroundColor: Colors.cyan)
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          backgroundColor: _backGroundColor[_selectedIndex],
        ));
  }
}
