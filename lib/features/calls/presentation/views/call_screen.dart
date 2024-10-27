import 'package:flutter/material.dart';
import 'package:minichat_project/features/calls/presentation/views/widgets/call_body.dart';

class CallScreen  extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CallBody(),
    );
  }
}
