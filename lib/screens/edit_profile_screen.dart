import 'package:flutter/material.dart';
import 'package:go_blog/controllers/edit_profile_controller.dart';
import 'package:go_blog/views/edit_profile_home_view.dart';
import 'package:go_blog/views/edit_profile_image_view.dart';
import 'package:go_blog/views/edit_profile_name_view.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with TickerProviderStateMixin {
  final List<Widget> views = const [
    EditProfileHomeView(),
    EditProfileImageView(),
    EditProfileNameView(),
  ];
  late final TabController tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,
  );
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EditProfileCotroller>();
    tabController.index = controller.tabBarIndex;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            controller.onBack(context);
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: views,
        ),
      ),
    );
  }
}
