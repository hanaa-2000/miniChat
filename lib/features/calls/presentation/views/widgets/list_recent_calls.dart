import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/styles.dart';

import '../../../../../core/constants/assets_app.dart';

class ListRecentCalls extends StatelessWidget {
  const ListRecentCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2),
          child: ListTile(
           leading :  CircleAvatar(
             backgroundImage: const AssetImage(AssetsApp.img),
             radius: 30.r,
           ),
            title: Text("Marwan Ali",style: StylesApp.textStyle18.copyWith(fontWeight: FontWeight.bold),),
            subtitle: Text("Today, 12:00 PM",style: StylesApp.textStyle18,),
            trailing: const Icon(Icons.phone,color: Colors.green,),
          ),
        );
        },
    );
  }
}
