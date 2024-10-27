import 'package:flutter/material.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/floating_action_widget.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/chats_body.dart';

class ChatsScreen  extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatsBody(),
      floatingActionButton: FloatingActionWidget(),
    );
  }
}
