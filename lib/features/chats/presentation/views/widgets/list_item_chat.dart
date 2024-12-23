import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minichat_project/core/constants/assets_app.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/features/chats/presentation/viewModel/chats_cubit/chats_cubit.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/bubble_chat_widget.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/item_chat_body.dart';
import '../../../../../core/shared_widgets/functions_helper.dart';

class ListItemChat extends StatefulWidget {
  const ListItemChat({super.key});

  @override
  State<ListItemChat> createState() => _ListItemChatState();
}

class _ListItemChatState extends State<ListItemChat> {

  @override
  Widget build(BuildContext context) {
    return   StreamBuilder<QuerySnapshot>(
        stream: firebaseFirestore.collection(userCollection).where("email",isNotEqualTo: currentUser!.email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center (child: CircularProgressIndicator(),);
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No users found'));
          }
          var users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var user = users[index].data() as Map<String, dynamic>;
              String name = user['name'] ?? 'No name';
              String phone = user['phone'] ?? 'No phone';
              String email = user['email'] ?? 'No email';
              String img = user['profileImage']??AssetsApp.img;
              if (email == currentUser!.email) {
                return const SizedBox();
              }
              return GestureDetector(
                  onTap: () {
                    String chatId = BlocProvider.of<ChatsCubit>(context).generateChatIdForUsers(currentUser!.email!, email);
                    navigatorApp(
                        context: context, widget:  BubbleChatWidget(userName:name ,phone: phone,email: email,chatId: chatId,));
                  },
                  child:  ItemChatBody(userName: name,phone: phone,img:img ,));
            },
          );




        },);






    //   BlocBuilder<ChatsCubit, ChatsState>(
    //   builder: (context, state) {
    //     if (state is UsersLoading) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (state is UsersSuccess) {
    //       return ListView.builder(
    //         itemCount: state.users.length,
    //         shrinkWrap: true,
    //           physics: const BouncingScrollPhysics(),
    //         itemBuilder: (context, index) {
    //           final user = state.users[index];
    //          return GestureDetector(
    //           onTap: () {
    //           navigatorApp(
    //           context: context, widget:  BubbleChatWidget(userName:user['name'] ,));
    //           },
    //           child:  ItemChatBody(userName: user['name'] ?? 'No Name',));
    //           },
    //       );
    //     } else if (state is UsersFailure) {
    //       return Center(child: Text(state.mesError.toString()));
    //     }
    //     return Container();
    //   },
    //
    // );
  }

}
