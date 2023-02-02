import 'package:flutter/material.dart';
import 'package:go_blog/widgets/timeline/timeline_list_tile.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Timeline'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 10,
          top: 20,
          right: 10,
          bottom: 20,
        ),
        children: const [
          TimelineListTile(),
          TimelineListTile(),
          TimelineListTile(),
        ],
      ),
    );
  }
}
