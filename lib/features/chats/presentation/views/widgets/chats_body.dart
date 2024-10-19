import 'package:flutter/material.dart';
import 'package:minichat_project/core/sharedWidgets/appbar_widget.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/list_item_chat.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/item_chat_body.dart';

class ChatsBody  extends StatelessWidget {
  const ChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListItemChat(),
        ],
      ),
    );
  }
}