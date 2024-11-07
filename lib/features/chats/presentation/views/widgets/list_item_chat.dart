import 'package:flutter/material.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/bubble_chat_widget.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/item_chat_body.dart';

import '../../../../../core/shared_widgets/functions_helper.dart';

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
              return GestureDetector(
                  onTap: (){
                    navigatorApp(context: context , widget: const BubbleChatWidget());
                  },
                  child: const ItemChatBody());
            },));
  }
}
