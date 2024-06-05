import 'package:beta_messenger/Screen/person_Screen.dart';
import 'package:flutter/material.dart';

import 'Home_Page.dart';
import 'Stories_Screen.dart';


class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Messenger(),
     Person(),
    const Stories(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_outlined,size: 35,),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 35,),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_stories,size: 35,),
            label: 'Stories',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 18), // Set font size for selected label
        unselectedLabelStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}