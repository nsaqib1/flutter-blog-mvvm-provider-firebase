import 'package:flutter/material.dart';
import 'package:go_blog/dymmy_data.dart' as data;

class ReadBlogScreen extends StatelessWidget {
  const ReadBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/images/image1.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UserInfoAndDuration(),
                      const SizedBox(height: 10),
                      Text(
                        'Category',
                        style: TextStyle(color: Colors.amber.shade900),
                      ),
                      const Text(
                        'Title of the blog Title of the blog',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        data.blog_body,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.2,
                          wordSpacing: 2,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyRoundButton(
                  icon: Icons.chevron_left_outlined,
                  onTapCallback: Navigator.of(context).pop,
                ),
                MyRoundButton(
                  icon: Icons.bookmark_border,
                  onTapCallback: Navigator.of(context).pop,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserInfoAndDuration extends StatelessWidget {
  const UserInfoAndDuration({
    Key? key,
  }) : super(key: key);

  final String name = 'username';
  final String timeAgo = '1 min ago';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  timeAgo,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            Icon(
              Icons.watch_later_outlined,
              size: 18,
              color: Colors.grey.shade600,
            ),
            const SizedBox(width: 3),
            Text(
              '10 min',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyRoundButton extends StatelessWidget {
  const MyRoundButton({
    Key? key,
    required this.onTapCallback,
    required this.icon,
  }) : super(key: key);

  final Function onTapCallback;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapCallback(),
      child: Card(
        margin: const EdgeInsets.all(10),
        color: const Color.fromARGB(164, 255, 255, 255),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon),
        ),
      ),
    );
  }
}
