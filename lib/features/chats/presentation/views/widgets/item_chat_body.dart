import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/image_item_widget.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/item_time_widget.dart';

import 'item_chat_widget.dart';

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
              const ImageItemWidget(),
              SizedBox(width: 20.w,),
              const ItemChatWidget(),
            ],
          ),
          ItemTimeWidget(),

        ],
      ),
    );
  }
}
