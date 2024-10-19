import 'package:flutter/material.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/list_status_recent.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/list_status_viewed.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/my_status_body.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/text_status.dart';

class StatusBody  extends StatelessWidget {
  const StatusBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          MyStatusBody(),
          SizedBox(height: 20,),
          TextStatus(text: "Recent Updates",),
          SizedBox(height: 12,),
          ListStatusRecent(),
          SizedBox(height: 12,),
          TextStatus(text: "Viewed Updates",),
          ListStatusViewed(),


        ],
      ),
    );
  }
}