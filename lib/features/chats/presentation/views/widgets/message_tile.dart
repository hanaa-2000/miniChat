import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';

class MessageTile extends StatefulWidget {
  const MessageTile({super.key, required this.message, required this.sender, required this.sentByMe, required this.date});
  final String message;
  final String sender;
  final bool sentByMe;
  final String date;
  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 4.h,
        bottom: 4.h,
        left: widget.sentByMe?0:24.w,
        right: widget.sentByMe?24.w:0,
      ),
      alignment:widget.sentByMe?Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        margin: widget.sentByMe?const EdgeInsets.only(
          left: 30,
        ): EdgeInsets.only(
          right: 30.w,
        ),
        padding:  EdgeInsets.only(
          top: 16.h,
          bottom: 16.h,
          left: 20.w,
          right: 20.w,
        ),
        decoration: BoxDecoration(
          borderRadius:widget.sentByMe?  BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
          ): BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          color: !widget.sentByMe?Colors.green[300]:ColorsApp.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   widget.sender.toUpperCase(),
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(
            //     fontSize: 13,
            //     fontWeight: FontWeight.bold,
            //     //color: Colors.white,
            //     letterSpacing: -0.5,
            //   ),
            // ),
            // const SizedBox(height: 8,),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style:  TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                 // color: Colors.white
              ),
            ),
            SizedBox(height: 8.h,),
            Text(widget.date,style: StylesApp.textStyle16.copyWith(fontSize: 14.sp,fontWeight: FontWeight.normal),),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //      Icon(Icons.check_sharp,size: 20.sp,color: Colors.blueAccent,),
            //      SizedBox(width: 8.w,),
            //     Text(widget.date,style: StylesApp.textStyle16.copyWith(fontSize: 14.sp,fontWeight: FontWeight.normal),),
            //
            //   ],
            // )
            ],
        ),
      ),
    );
  }
}
