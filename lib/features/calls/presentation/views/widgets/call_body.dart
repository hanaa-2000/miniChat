import 'package:flutter/material.dart';
import 'package:minichat_project/features/calls/presentation/views/widgets/list_recent_calls.dart';

class CallBody  extends StatelessWidget {
  const CallBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ListRecentCalls(),
      ],
    );
  }
}
