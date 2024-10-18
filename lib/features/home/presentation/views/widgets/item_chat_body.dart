import 'package:flutter/material.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/image_item_widget.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/item_chat_widget.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/item_time_widget.dart';

class ItemChatBody  extends StatelessWidget {
  const ItemChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageItemWidget(),
              SizedBox(width: 20,),
              ItemChatWidget(),
            ],
          ),
          ItemTimeWidget(),

        ],
      ),
    );
  }
}
