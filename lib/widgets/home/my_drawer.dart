import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_blog/controllers/app_controller.dart';
import 'package:go_blog/controllers/compose_controller.dart';
import 'package:go_blog/controllers/edit_profile_controller.dart';
import 'package:go_blog/screens/compose_screen.dart';
import 'package:go_blog/screens/edit_profile_screen.dart';
import 'package:go_blog/screens/timeline_screen.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = context.read<AppController>();
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/image1.jpeg'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'User Name',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@username',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: double.infinity),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => EditProfileCotroller(),
                                child: const EditProfileScreen(),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.mode_edit),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => ComposeController(),
                          child: const ComposeScreen(),
                        ),
                      ),
                    );
                  },
                  leading: const Icon(Icons.edit_note),
                  title: const Text('Compose'),
                  trailing: const Icon(Icons.chevron_right),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const TimelineScreen(),
                      ),
                    );
                  },
                  leading: const Icon(Icons.history),
                  title: const Text('Timeline'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  appController.auth.logout();
                  appController.changeLogginStatus(false);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.deepOrange,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
