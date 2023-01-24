import 'package:flutter/material.dart';

import '../widgets/task_list_builder.dart';
import 'drawer_screen.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});
  static const routeName = '/recycle-bin-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin is here'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Chip(
              label: Text(
                'Tasks: ',
              ),
            ),
          ),
          TasksListBuilder(tasksList: [])
        ],
      ),
    );
  }
}
