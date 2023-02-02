import 'package:flutter/material.dart';

class EditDescView extends StatelessWidget {
  const EditDescView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          minLines: 20,
          maxLines: 2000,
          enableInteractiveSelection: true,
          decoration: InputDecoration(
            hintText: 'Content',
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
