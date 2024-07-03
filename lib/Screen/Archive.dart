import 'package:beta_messenger/Screen/person_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Drawer.dart';
import 'Home_Page.dart';

class Archive extends StatefulWidget {
  const Archive({super.key});

  @override
  State<Archive> createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<PersonData> people = [
    PersonData(
      name: 'Rony Sarker',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKfZS7sKX1MJ7WClhNt2EwP12GbFzpc-09wYP1_VPknMkG1v3JWS9o_WEBAlj0CrrqIy0&usqp=CAU',
    ),
    PersonData(
      name: 'Rony Sarker',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://static.vecteezy.com/system/resources/thumbnails/002/002/427/small/man-avatar-character-isolated-icon-free-vector.jpg',
    ),
    PersonData(
      name: 'Kalam Hosain',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKfZS7sKX1MJ7WClhNt2EwP12GbFzpc-09wYP1_VPknMkG1v3JWS9o_WEBAlj0CrrqIy0&usqp=CAU',
    ),
    PersonData(
      name: 'Sarker',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-QIz71SYDWmfMrtFfkUeUoc6sNpEKow1D4HXT3uG5Ix_ayopwn0FlAmAPEO0fjLT_e_o&usqp=CAU',
    ),
    PersonData(
      name: 'Rony',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKfZS7sKX1MJ7WClhNt2EwP12GbFzpc-09wYP1_VPknMkG1v3JWS9o_WEBAlj0CrrqIy0&usqp=CAU',
    ),
    PersonData(
      name: 'Rony Sarker',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKfZS7sKX1MJ7WClhNt2EwP12GbFzpc-09wYP1_VPknMkG1v3JWS9o_WEBAlj0CrrqIy0&usqp=CAU',
    ),
    PersonData(
      name: 'Rony Sarker',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://static.vecteezy.com/system/resources/thumbnails/002/002/427/small/man-avatar-character-isolated-icon-free-vector.jpg',
    ),
    PersonData(
      name: 'Kalam Hosain',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKfZS7sKX1MJ7WClhNt2EwP12GbFzpc-09wYP1_VPknMkG1v3JWS9o_WEBAlj0CrrqIy0&usqp=CAU',
    ),
    PersonData(
      name: 'Sarker',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-QIz71SYDWmfMrtFfkUeUoc6sNpEKow1D4HXT3uG5Ix_ayopwn0FlAmAPEO0fjLT_e_o&usqp=CAU',
    ),
    PersonData(
      name: 'Rony',
      info: 'Share Some Information is there.',
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKfZS7sKX1MJ7WClhNt2EwP12GbFzpc-09wYP1_VPknMkG1v3JWS9o_WEBAlj0CrrqIy0&usqp=CAU',
    ),
    // Add more PersonData objects as needed
  ];

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
        title: const Text('Archive'),
      ),
      drawer: const Drawer_Widget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Column(
              children: people.map((person) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          person.imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person.name,
                              style: const TextStyle( fontSize: 16),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  person.info,
                                  style: const TextStyle( fontSize: 12),
                                ),
                                const Text(
                                  'Today',
                                  style: TextStyle( fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

          ],
        ),
      ),
    );
  }
}
