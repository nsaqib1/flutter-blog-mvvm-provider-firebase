import 'package:flutter/material.dart';

class EditImageView extends StatelessWidget {
  const EditImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/image2.png'),
            ),
            Positioned(
              bottom: -6,
              right: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {},
                child: const Icon(Icons.add_photo_alternate),
              ),
            ),
          ],
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
