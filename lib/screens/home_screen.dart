import 'package:flutter/material.dart';
import 'package:go_blog/controllers/home_controller.dart';
import 'package:go_blog/widgets/home/blog_list_tile.dart';
import 'package:go_blog/widgets/home/my_drawer.dart';
import 'package:go_blog/widgets/home/user_identity.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  onTapCallback(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch<HomeController>();
    return Scaffold(
      endDrawer: const SafeArea(
        child: MyDrawer(),
      ),
      backgroundColor: Colors.indigo.shade200,
      appBar: AppBar(
        title: const Text('Go Blog'),
        actions: [
          Builder(builder: (context) {
            return UserIdentity(
              onTapCallback: () => onTapCallback(context),
            );
          }),
        ],
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: Container(
          color: Colors.grey.shade200,
          child: FutureBuilder(
            future: controller.getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                    left: 10,
                    right: 10,
                  ),
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, _) => const SizedBox(height: 20),
                  itemBuilder: (context, index) =>
                      BlogListTile(blog: snapshot.data![index]),
                );
              } else if (snapshot.hasError) {
                return const Text('No Post found!');
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
