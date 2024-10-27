import 'package:flutter/material.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/image_status_recent.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/title_my_status_widget.dart';

class ListStatusRecent extends StatelessWidget {
  const ListStatusRecent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            children: [
              ImageStatusRecent(statusRead: true),
              SizedBox(
                width: 20,
              ),
              TitleMyStatusWidget(
                nameStatus: "Rowan Ali",
                timeStatus: "Today, 12:00 PM",
              ),
            ],
          ),
        );
      },
    );
  }
}
