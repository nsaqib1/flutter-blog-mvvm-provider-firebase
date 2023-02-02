import 'package:flutter/material.dart';
import 'package:go_blog/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class UserIdentity extends StatefulWidget {
  const UserIdentity({
    Key? key,
    required this.onTapCallback,
  }) : super(key: key);

  final Function onTapCallback;

  @override
  State<UserIdentity> createState() => _UserIdentityState();
}

class _UserIdentityState extends State<UserIdentity> {
  @override
  void initState() {
    context.read<HomeController>().getUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch<HomeController>();
    return Row(
      children: [
        Text(controller.username),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => widget.onTapCallback(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              color: Colors.blue,
              height: 40,
              width: 40,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
