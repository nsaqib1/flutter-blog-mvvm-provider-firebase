import 'package:flutter/material.dart';
import 'package:go_blog/controllers/edit_profile_controller.dart';
import 'package:provider/provider.dart';

class EditProfileHomeView extends StatelessWidget {
  const EditProfileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<EditProfileCotroller>();
    return ListView(
      children: [
        Card(
          color: Colors.white,
          child: ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Profile Picture'),
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
            title: const Text('Name'),
            trailing: TextButton(
              onPressed: () {
                controller.viewChange(2);
              },
              child: const Text('Change >'),
            ),
          ),
        ),
      ],
    );
  }
}
