import 'package:flutter/material.dart';

import '../Screen/Setting.dart';

class Dark_mode extends StatefulWidget {
  const Dark_mode({Key? key}) : super(key: key);

  @override
  State<Dark_mode> createState() => _Dark_modeState();
}

class _Dark_modeState extends State<Dark_mode> {
  String selectedOption = 'System'; // Default selected option

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
              MaterialPageRoute(builder: (context) => const Setting()),
                  (route) => false,
            );
          },
        ),
        title: const Text('Dark mode'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedOption = 'Off';
                  });
                  _updateTheme();
                },
                child: Row(
                  children: [
                    Radio(
                      value: 'Off',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                        _updateTheme();
                      },
                    ),
                    const Text('Off'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedOption = 'On';
                  });
                  _updateTheme();
                },
                child: Row(
                  children: [
                    Radio(
                      value: 'On',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                        _updateTheme();
                      },
                    ),
                    const Text('On'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedOption = 'System';
                  });
                  _updateTheme();
                },
                child: Row(
                  children: [
                    Radio(
                      value: 'System',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                        _updateTheme();
                      },
                    ),
                    const Text('System'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // Add space between options and additional text
          const Text(
            'Choose your preferred dark mode setting',
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }

  void _updateTheme() {
    ThemeData? theme;
    switch (selectedOption) {
      case 'Off':
        theme = _buildLightTheme();
        break;
      case 'On':
        theme = _buildDarkTheme();
        break;
      case 'System':
        theme = Theme.of(context).brightness == Brightness.dark
            ? _buildDarkTheme()
            : _buildLightTheme();
        break;
    }

    if (theme != null) {
      final MaterialApp app = MaterialApp(
        theme: theme,
        home: const Dark_mode(),
      );
      runApp(app);
    }
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
      // Add more light theme settings here
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      // Add more dark theme settings here
    );
  }
}
