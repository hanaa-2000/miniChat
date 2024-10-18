import 'package:flutter/material.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/item_chat_body.dart';

class ListItemChat  extends StatelessWidget {
  const ListItemChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
           itemCount: 10,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ItemChatBody();
            },));
  }
}
