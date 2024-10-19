import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/home/presentation/views/profile_screen.dart';

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
            icon: const Icon(
              Icons.search,
              size: 25,
              color: Colors.black45,
            )),
        PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey, width: .5),
          ),
          icon: const Icon(Icons.more_vert),
          constraints: const BoxConstraints(minWidth: 200),
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          position: PopupMenuPosition.under,
          itemBuilder: (context) {
            return [
              const PopupMenuItem<String>(
                child: Text("New Group",style: TextStyle(fontWeight: FontWeight.bold),),
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
