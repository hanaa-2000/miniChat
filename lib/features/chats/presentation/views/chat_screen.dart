import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minichat_project/core/shared_widgets/floating_action_widget.dart';
import 'package:minichat_project/features/chats/presentation/views/widgets/chats_body.dart';

import '../viewModel/chats_cubit/chats_cubit.dart';
import '../viewModel/repo/firebase_services.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatsBody(),
      floatingActionButton: FloatingActionWidget(icon: Icons.chat,),
    );
  }
}
