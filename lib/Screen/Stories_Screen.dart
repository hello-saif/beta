import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Drawer.dart';
import 'Home_Page.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> stories = [
    {
      'imageUrl': 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      'name': 'Add to story',
      'isAddStory': true,
    },
    {
      'imageUrl': 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      'name': 'Sazia Hossain',
      'isAddStory': false,
    },
    {
      'imageUrl': 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      'name': 'John Doe',
      'isAddStory': false,
    },
    {
      'imageUrl': 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      'name': 'Jane Smith',
      'isAddStory': false,
    },
    {
      'imageUrl': 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      'name': 'Alex Johnson',
      'isAddStory': false,
    },
    {
      'imageUrl': 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      'name': 'Emma Wilson',
      'isAddStory': false,
    },
    {
      'imageUrl': 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      'name': 'Alex Johnson',
      'isAddStory': false,
    },
    {
      'imageUrl': 'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
      'name': 'Emma Wilson',
      'isAddStory': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: AppBarIconButton(
          child: const Icon(Icons.format_line_spacing),
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Stories'),
      ),
      drawer: const Drawer_Widget(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72, // Adjust the aspect ratio as needed
        ),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return StoryCard(
            imageUrl: stories[index]['imageUrl'],
            name: stories[index]['name'],
            isAddStory: stories[index]['isAddStory'],
          );
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isAddStory;

  const StoryCard({
    super.key,
    required this.imageUrl,
    required this.name,
    this.isAddStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (isAddStory)
            const Positioned(
              top: 8,
              left: 8,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          if (!isAddStory)
            const Positioned(
              top: 8,
              left: 8,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp'), // Replace with your profile image URL
              ),
            ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
