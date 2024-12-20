import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/message_tile.dart';

class BubbleChatWidget  extends StatelessWidget {
  const BubbleChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rowan" ,style: StylesApp.textStyle21.copyWith(fontWeight: FontWeight.bold), ),
      ),
     body:  Stack(
        children: [
          chatMessages(),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
              padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.green[50],
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.circular(16.r)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style:  TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp
                      ),
                      decoration:  InputDecoration(
                        hintText: 'Send Message...',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                         // color: Colors.white
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                   SizedBox(
                    width: 12.w,
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: ColorsApp.green,
                       shape: BoxShape.circle
                       // borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  chatMessages() {
        return ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                MessageTile(
                    message: "Hellommmmmmmm",
                    sender: "hanaa",
                    sentByMe: true),
                MessageTile(
                    message: "Hello",
                    sender: "hanaa",
                    sentByMe: false),
              ],
            );
          },

    );
  }




}
