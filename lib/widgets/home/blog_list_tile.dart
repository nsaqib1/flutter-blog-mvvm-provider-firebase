import 'package:flutter/material.dart';
import 'package:go_blog/models/blog_model.dart';
import 'package:go_blog/screens/read_blog_screen.dart';

class BlogListTile extends StatelessWidget {
  const BlogListTile({
    super.key,
    required this.blog,
  });

  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ReadBlogScreen(),
        ),
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    blog.thumbUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '@username',
                        style: TextStyle(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        blog.category,
                        style: TextStyle(
                          color: Colors.amber.shade900,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 20),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
