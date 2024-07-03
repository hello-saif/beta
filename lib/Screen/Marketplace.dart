import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Drawer.dart';
import 'Home_Page.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      key: _scaffoldKey,

      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: AppBarIconButton(
          child: const Icon(Icons.format_line_spacing),
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Marketplace'),
        actions: [
          AppBarIconButton(
            child: const Icon(Icons.facebook),
            onTap: () {
              // Navigate to another screen if needed
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: const Drawer_Widget(),
    );
  }
}
