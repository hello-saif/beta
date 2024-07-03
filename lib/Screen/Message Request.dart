import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/Drawer.dart';
import 'FIrsttab_Screen.dart';
import 'SecondTab.dart';

class MessageRequest extends StatefulWidget {
  const MessageRequest({super.key});

  @override
  State<MessageRequest> createState() => _MessageRequestState();
}

class _MessageRequestState extends State<MessageRequest> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          icon: const Icon(Icons.format_line_spacing),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Message Request'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to another screen if needed
            },
          ),
          const SizedBox(width: 8),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'You May Know'),
            Tab(text: 'Spam'),
          ],
          labelColor: Colors.purple,
        ),
      ),
      drawer: const Drawer_Widget(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // 1st tab
          Firsttab(),
          // 2nd tab
          SecondTab(),
        ],
      ),
    );
  }
}
