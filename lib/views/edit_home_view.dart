import 'package:flutter/material.dart';
import 'package:go_blog/controllers/edit_screen_controller.dart';
import 'package:provider/provider.dart';

class EditHomeView extends StatelessWidget {
  const EditHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<EditScreenController>();
    return ListView(
      children: [
        Card(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Image'),
            trailing: TextButton(
              onPressed: () {
                controller.viewChange(1);
              },
              child: const Text('Change >'),
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(Icons.title),
            title: const Text('Title'),
            trailing: TextButton(
              onPressed: () {
                controller.viewChange(2);
              },
              child: const Text('Change >'),
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Category'),
            trailing: TextButton(
              onPressed: () {
                controller.viewChange(3);
              },
              child: const Text('Change >'),
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Description'),
            trailing: TextButton(
              onPressed: () {
                controller.viewChange(4);
              },
              child: const Text('Change >'),
            ),
          ),
        ),
      ],
    );
  }
}
