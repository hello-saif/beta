import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Drawer.dart';
import 'Home_Page.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: AppBarIconButton(
          child: const Icon(Icons.format_line_spacing),
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Stories'),
      ),
      drawer: const Drawer_Widget(),
    );
  }
}
