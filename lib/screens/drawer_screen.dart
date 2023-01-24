import 'package:flutter/material.dart';

import '../screens/recycle_bin_screen.dart';
import '../screens/tasks_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              onTap: () =>
                  Navigator.of(context).pushNamed(TasksScreen.routeName),
              leading: const Icon(Icons.folder_special_rounded),
              title: const Text('My Tasks List'),
            ),
            const Divider(),
            ListTile(
              onTap: () =>
                  Navigator.of(context).pushNamed(RecycleBinScreen.routeName),
              leading: const Icon(Icons.folder_delete_outlined),
              title: const Text('Recycle Bin'),
            ),
          ],
        ),
      ),
    );
  }
}
