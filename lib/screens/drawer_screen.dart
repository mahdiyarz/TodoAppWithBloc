import 'package:flutter/material.dart';

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
            const ListTile(
              leading: Icon(Icons.folder_special_rounded),
              title: Text('My Tasks List'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.folder_delete_outlined),
              title: Text('Recycle Bin'),
            ),
          ],
        ),
      ),
    );
  }
}
