import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/image_status_recent.dart';
import 'package:minichat_project/features/status/presentation/views/widgets/title_my_status_widget.dart';

class ListStatusViewed  extends StatelessWidget {
  const ListStatusViewed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              const ImageStatusRecent(statusRead: false),
              SizedBox(
                width: 20.w,
              ),
              const TitleMyStatusWidget(
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
