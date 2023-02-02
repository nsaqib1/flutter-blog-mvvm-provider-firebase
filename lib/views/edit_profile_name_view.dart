import 'package:flutter/material.dart';

class EditProfileNameView extends StatelessWidget {
  const EditProfileNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: Text('Change'),
        ),
      ],
    );
  }
}
