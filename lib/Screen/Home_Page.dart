import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/Drawer.dart';
import '../widget/TabBar.dart';
import '../widget/stories,dart.dart';
import 'Login_Process/Email_Verify.dart';

class Messenger extends StatefulWidget {
  const Messenger({super.key});

  @override
  State<Messenger> createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchTEController = TextEditingController();

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
        title: const Text('Chat'),
        actions: [
          AppBarIconButton(
            child: const Icon(Icons.login_outlined),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmailVerificationScreen()),
                  (route) => false);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: const Drawer_Widget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchTextField(),
             SizedBox(
              height: 150, // Adjust the height for MyListView
              child: MyListView(),
            ),
            const SizedBox(
              height: 300, // Adjust the height for MyTabBar
              child: MyTabBar(),
            ),
          ],
        ),
      )
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(48),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(48),
        ),
      ),
    );
  }
}

class AppBarIconButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const AppBarIconButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: child,
      onPressed: onTap,
    );
  }
}
