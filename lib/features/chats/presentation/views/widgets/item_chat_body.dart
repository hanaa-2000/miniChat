import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/image_item_widget.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/item_time_widget.dart';

import 'item_chat_widget.dart';

class ItemChatBody  extends StatelessWidget {
  const  ItemChatBody({super.key, required this.userName, required this.phone, required this.img, });
final String userName ,phone,img;
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
               ImageItemWidget(img:img ,),
              SizedBox(width: 20.w,),
               ItemChatWidget(name:userName, phone:phone,),
            ],
          ),
          ItemTimeWidget(),

        ],
      ),
    );
  }
}
