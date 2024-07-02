import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/Dark_mode.dart';
import 'Home_Page.dart';
import 'bottomNavBar.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MyBottomNavBar()),
                  (route) => false,
            );
          },
        ),
        title: const Text('Me'),
        actions: [
          IconButton(
            icon: const Icon(Icons.fit_screen),
            onPressed: () {
              // Navigate to another screen if needed
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 150,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Saifuddin Nobab', // Replace with your desired text
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Leave a note', // Replace with your desired text
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),

                ],
              ),
            ],
          ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark mode'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Dark_mode()),
                (route) => false,);
                // Handle the tap
              },
            ),
          ListTile(
            leading: const Icon(Icons.local_activity_rounded),
            title: const Text('Active Status'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.ac_unit),
            title: const Text('Username'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.qr_code),
            title: const Text('QR code'),
            onTap: () {
              // Handle the tap
            },
          ),

        ],
      ),
    );
  }
}
