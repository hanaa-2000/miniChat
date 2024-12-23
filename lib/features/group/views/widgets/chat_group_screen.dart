import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';

import '../../../chats/presentation/viewModel/chats_cubit/chats_cubit.dart';

class ChatGroupScreen  extends StatefulWidget {
  const ChatGroupScreen({super.key, required this.groupId, required this.groupName});
  final String groupId, groupName;

  @override
  State<ChatGroupScreen> createState() => _ChatGroupScreenState();
}

class _ChatGroupScreenState extends State<ChatGroupScreen> {
  final TextEditingController _messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ChatsCubit>().loadGroupMessages(widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(widget.groupName),
          ],
        ),
      ),
      body: Column(
        children: [

          Expanded(
              child: BlocBuilder<ChatsCubit,ChatsState>(
                  builder:(context, state) {
                    if (state is GroupMessagesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }else if(state is GroupMessagesSuccess){
                      return ListView.builder(
                        reverse: true,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            final isSender = message.senderId == currentUser!.email;
                            return Align(
                              alignment: isSender
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: isSender
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: isSender
                                          ? Colors.green[100]
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.only(
                                        topLeft: const Radius.circular(12),
                                        topRight: const Radius.circular(12),
                                        bottomLeft: isSender
                                            ? const Radius.circular(12)
                                            : const Radius.circular(0),
                                        bottomRight: isSender
                                            ? const Radius.circular(0)
                                            : const Radius.circular(12),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message.senderId,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey[700]),
                                        ),
                                        Text(
                                          message.messageTxt,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: isSender
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      Text(
                                       context.read<ChatsCubit>().formatTimestamp(message.timeStamp),
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                      );
                    }else if (state is GroupMessagesFailure) {
                      return Center(
                        child: Text(
                          state.errorMessage,
                        ),
                      );
                    } else if (state is SendGroupMessageLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SendGroupMessageFailure) {
                      return Center(
                        child: Text(
                            'Error occurred while sending message: ${state.errorMessage}'),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
              ),
          ),
          _buildMessageInput(),
        ],
      ),


    );
  }
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.green,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                context.read<ChatsCubit>().sendGroupMessage(
                    widget.groupId,
                    _messageController.text,
                    currentUser!.email!
                );
                _messageController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
