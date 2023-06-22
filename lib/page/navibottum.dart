import 'package:flutter/material.dart';
import 'package:project_flutter2/page/canhan_page.dart';
import 'package:project_flutter2/page/home.dart';
import 'package:project_flutter2/page/tienich_page.dart';


class naviBottum extends StatefulWidget {
  const naviBottum({Key? key}) : super(key: key);


  @override
  _naviBottumState createState() => _naviBottumState();
}

class _naviBottumState extends State<naviBottum> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  List<Widget> _current = [
    HomePage(),
    tienichPage(),
    CaNhanPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _current.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
        // onTap: (index)=> setState(() => currentIndex = index),
        unselectedItemColor: Color(0xFF5E5E5E),
        selectedItemColor: Color(0xff06AB8D),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_sharp),
              label:'Tin tức'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_command_key),
              label:'Tiện ích'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label:'Cá nhân'
          ),
        ],
      ),
    );
  }
}

