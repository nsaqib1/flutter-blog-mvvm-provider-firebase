import 'package:flutter/material.dart';

class EditProfileImageView extends StatelessWidget {
  const EditProfileImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Stack(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/image1.jpeg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(Icons.add_a_photo),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Change'),
        ),
      ],
    );
  }
}
