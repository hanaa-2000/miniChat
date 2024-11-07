import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/home/presentation/views/profile_screen.dart';

import '../../features/home/presentation/views/new_group_screen.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "WhatsUp",
        style: StylesApp.textStyle24.copyWith(color: Colors.black),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon:  Icon(
              Icons.search,
              size: 25.sp,
              color: Colors.black45,
            )),
        PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: const BorderSide(color: Colors.grey, width: .5),
          ),
          icon: const Icon(Icons.more_vert),
          constraints:  BoxConstraints(minWidth: 200.w),
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          position: PopupMenuPosition.under,
          itemBuilder: (context) {
            return [
               PopupMenuItem<String>(
                child: const Text("New Group",style: TextStyle(fontWeight: FontWeight.bold),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewGroupScreen(),));
                },
              ),
               PopupMenuItem(
                child: const Text("Profile",style: TextStyle(fontWeight: FontWeight.bold)),
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
                 },
              ),
            ];
          },
        ),
      ],
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
