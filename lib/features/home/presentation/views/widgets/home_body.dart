import 'package:flutter/material.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/appbar_widget.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/item_chat_body.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/list_item_chat.dart';

class HomeBody  extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          AppbarWidget(),
          ListItemChat(),
        ],
      ),
    );
  }
}
