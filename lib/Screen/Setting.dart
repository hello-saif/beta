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
      body: SingleChildScrollView(


      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'For Families',
              style: Theme.of(context).textTheme.titleSmall, // Use the same style as ListTile title
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Supervision'),
            onTap: () {
              // Handle the tap
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Services',
              style: Theme.of(context).textTheme.titleSmall, // Use the same style as ListTile title
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_border),
            title: const Text('Order'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.payments),
            title: const Text('Payment'),
            onTap: () {
              // Handle the tap
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Preferences',
              style: Theme.of(context).textTheme.titleSmall, // Use the same style as ListTile title
            ),
          ),
          ListTile(
            leading: const Icon(Icons.man),
            title: const Text('Avatar'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy and Safety'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.notification_add),
            title: const Text('Notifications and Sounds'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Data Saver'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Photos and Media'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble_outlined),
            title: const Text('Chat Heads'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('App Update'),
            onTap: () {
              // Handle the tap
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Safety',
              style: Theme.of(context).textTheme.titleSmall, // Use the same style as ListTile title
            ),
          ),
          ListTile(
            leading: const Icon(Icons.switch_camera_outlined),
            title: const Text('Switch Account'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.error_outline_sharp),
            title: const Text('Report Technical Problem'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            onTap: () {
              // Handle the tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.legend_toggle_sharp),
            title: const Text('Legal and Policies'),
            onTap: () {
              // Handle the tap
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Meta ',
                  style: Theme.of(context).textTheme.labelLarge, // Use the same style as ListTile title
                ),
                const SizedBox(height: 5,),
                Text(
                  'Account Center ',
                  style: Theme.of(context).textTheme.titleSmall, // Use the same style as ListTile title
                ),
                Text(
                  'Manage your connected experiences and account setting across Meta technologies. ',
                  style: Theme.of(context).textTheme.titleSmall, // Use the same style as ListTile title
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Personal Details'),
                  onTap: () {
                    // Handle the tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.security_rounded),
                  title: const Text('Password and Security'),
                  onTap: () {
                    // Handle the tap
                  },
                ),
                Text(
                  'See more in Account Centre ',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.blue), // Use the same style as ListTile title and add color
                ),
              ],
            ),
          ),

        ],
      ),
      ),
    );
  }
}
