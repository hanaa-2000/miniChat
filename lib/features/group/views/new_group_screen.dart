import 'package:flutter/material.dart';
import 'package:minichat_project/features/group/views/widgets/new_group_body.dart';

class NewGroupScreen  extends StatelessWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NewGroupBody(),
    );
  }
}
