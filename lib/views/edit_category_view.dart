import 'package:flutter/material.dart';

class EditCategoryView extends StatelessWidget {
  const EditCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Category',
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
