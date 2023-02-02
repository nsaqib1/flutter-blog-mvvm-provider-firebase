import 'package:flutter/material.dart';
import 'package:go_blog/controllers/edit_screen_controller.dart';
import 'package:go_blog/views/edit_category_view.dart';
import 'package:go_blog/views/edit_desc_view.dart';
import 'package:go_blog/views/edit_home_view.dart';
import 'package:go_blog/views/edit_image_view.dart';
import 'package:go_blog/views/edit_title_view.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> with TickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: 5,
    vsync: this,
    initialIndex: 0,
  );
  List<Widget> views = const [
    EditHomeView(),
    EditImageView(),
    EditTitleView(),
    EditCategoryView(),
    EditDescView(),
  ];
  int tabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EditScreenController>();
    tabController.index = controller.tabBarIndex;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Edit'),
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
