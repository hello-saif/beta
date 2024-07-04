import 'package:beta_messenger/Screen/Message%20Request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screen/Archive.dart';
import '../Screen/Marketplace.dart';
import '../Screen/Setting.dart';
import '../Screen/bottomNavBar.dart';

class Drawer_Widget extends StatelessWidget {
  const Drawer_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg', // Replace with your image URL
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'Saifuddin',
                  style: TextStyle(
                    fontSize: 16, // Increase font size
                    fontWeight: FontWeight.bold, // Make text bold
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Setting()),
                          (route) => false);
                    },
                    icon: const Icon(Icons.settings))
              ],
            ),
          ),
          //https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Chat'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyBottomNavBar()),
                  (route) => false);
              // Handle the tap
            },
          ),
          ListTile(
            leading: Icon(Icons.home_work_outlined),
            title: Text('MArketplace'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Marketplace()),
                  (route) => false);

              // Handle the tap
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_bubble_outline),
            title: Text('Message Request'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MessageRequest()),
                  (route) => false);

              // Handle the tap
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet_sharp),
            title: Text('Archive'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Archive()),
                  (route) => false);

              // Handle the tap
            },
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              const Text(
                'Communities',
                style: TextStyle(
                  fontSize: 16, // Increase font size
                  //fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text('Edit'))
            ],
          ),
          Column(
            children: List.generate(10, (index) {
              return const Column(
                children: [
                  Communities_Widget(),
                  SizedBox(height: 10), // Add space between rows
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class Communities_Widget extends StatelessWidget {
  const Communities_Widget({
    super.key,
  });
  String _truncateName(String name) {
    if (name.length > 15) {
      return '${name.substring(0, 15)}...';
    } else {
      return name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.all(10)),
        ClipOval(
          child: Image.network(
            'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg', // Replace with your image URL
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _truncateName('Saifuddin Nobab 1'),
              style: const TextStyle(
                fontSize: 16, // Font size
                fontWeight: FontWeight.bold, // Make text bold
              ),
              maxLines: 3,
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
            const Text(
              '14.5K active',
              style: TextStyle(
                fontSize: 10, // Font size
              ),
            ),
          ],
        ),
      ],
    );
  }
}
