import 'package:flutter/material.dart';
import 'package:minichat_project/core/shared_widgets/functions_helper.dart';
import 'package:minichat_project/features/group/views/new_group_screen.dart';
import 'package:minichat_project/features/group/views/widgets/group_view_body.dart';
import '../../../core/shared_widgets/appbar_widget.dart';
import '../../../core/shared_widgets/floating_action_widget.dart';

class GroupView  extends StatelessWidget {
  const GroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const GroupViewBody(),
      floatingActionButton: FloatingActionWidget(icon: Icons.group_add_outlined,onPressed: () {
        navigatorApp(widget:const NewGroupScreen(), context: context);
      },),

    ) ;
  }
}
