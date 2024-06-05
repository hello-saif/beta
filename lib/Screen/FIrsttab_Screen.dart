import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Firsttab extends StatefulWidget {
  const Firsttab({super.key});

  @override
  State<Firsttab> createState() => _FirsttabState();
}

class _FirsttabState extends State<Firsttab> {
  final List<Map<String, String>> _people = [
    {
      'name': 'Ali Hasan',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    {
      'name': 'Saifuddin',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    {
      'name': 'Nayem',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    {
      'name': 'Ali Hasan',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    {
      'name': 'Saifuddin',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    {
      'name': 'Nayem',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    {
      'name': 'Ali Hasan',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    {
      'name': 'Saifuddin',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    {
      'name': 'Nayem',
      'imageUrl': 'https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg',
    },
    // Add more name-image pairs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: _people.map((person) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.network(
                      person['imageUrl']!, // Get the image URL
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 4), // Add some space between the image and text
                  Text(
                    person['name']!, // Get the name
                    style: const TextStyle(
                      fontSize: 16, // Font size
                      fontWeight: FontWeight.bold, // Make text bold
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
