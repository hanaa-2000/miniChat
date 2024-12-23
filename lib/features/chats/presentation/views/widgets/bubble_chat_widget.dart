import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/chats/presentation/viewModel/chats_cubit/chats_cubit.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/message_tile.dart';

class BubbleChatWidget extends StatefulWidget {
  const BubbleChatWidget({super.key, required this.userName, required this.phone, required this.email, required this.chatId});
final String userName;
final String phone;
final String email;
final String chatId;
  @override
  State<BubbleChatWidget> createState() => _BubbleChatWidgetState();
}

class _BubbleChatWidgetState extends State<BubbleChatWidget> {
  TextEditingController messageController = TextEditingController();
@override
  void initState() {

  BlocProvider.of<ChatsCubit>(context).loadMessages(widget.chatId);
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        surfaceTintColor:Colors.green[50],

        elevation: 0,

        title: Text(
          widget.userName,
          style: StylesApp.textStyle21.copyWith(fontWeight: FontWeight.bold),
        ),
       // leading: IconButton(onPressed: (){
       //   Navigator.pop(context);
       //
       //     BlocProvider.of<ChatsCubit>(context).getAllUser();
       //
       //
       // }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatsCubit, ChatsState>(
              builder: (context, state) {
                if (state is ChatsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatsSuccess) {
                  final messages = state.messages;
                  return ListView.builder(
                  itemCount: messages.length,
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final isSender = message.senderId == widget.email;
                      final date = context.read<ChatsCubit>().formatTimestamp(message.timeStamp);
                      return MessageTile(date: date,
                          message: message.messageTxt, sender: message.senderId, sentByMe:isSender  );
                    },
                  );
                } else if (state is ChatsFailure) {
                  return Center(child: Text(state.mesError!));
                }
                else if (state is SendMessageLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SendMessageFailure) {
                  return Center(
                    child: Text(
                        'Error occured while sending message: ${state.errorMessage}'),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin:
              EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              padding:
              EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(16.r)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style:
                      TextStyle(color: Colors.black, fontSize: 18.sp),
                      decoration: InputDecoration(
                        hintText: 'Send Message...',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          // color: Colors.white
                        ),
                        border: InputBorder.none,
                      ),
                      controller: messageController,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      final text = messageController.text.trim();
                      if (text.isNotEmpty) {
                        context.read<ChatsCubit>().sendMessage(currentUser!.email!,text,widget.chatId);
                        messageController.clear();
                      }
                    },
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: ColorsApp.green, shape: BoxShape.circle
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

//   chatMessages({messages}) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: messages.length,
//         reverse: true,
//         padding: const EdgeInsets.symmetric(
//             vertical: 10, horizontal: 10),
//         shrinkWrap: true,
//               itemBuilder: (context, index) {
//           final message = messages[index];
//           final isSender = message.senderId == widget.email;
//           return MessageTile(
//               message: message.messageTxt, sender: message.senderId, sentByMe:isSender  );
//         },
//       ),
//     );
//   }
 }
