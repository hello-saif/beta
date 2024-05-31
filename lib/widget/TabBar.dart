import 'package:flutter/material.dart';

import '../Screen/FIrsttab_Screen.dart';
import '../Screen/SecondTab.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2, // There are 2 tabs
      child: Scaffold(
        body: Column(
          children: [
          TabBar(
            tabs: [
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Channels',
              ),
            ],
            labelColor: Colors.purple,
          ),

            Expanded(
              child: TabBarView(
                children: [
                  // 1st tab
                 Firsttab(),
                  // 2nd tab
                  SecondTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


