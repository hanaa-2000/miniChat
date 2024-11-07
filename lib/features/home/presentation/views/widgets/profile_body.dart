import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/styles.dart';

import '../../../../../core/constants/assets_app.dart';
import '../../../../../core/themes/colors.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            height: 20.h,
          ),
          Stack(children: [
             CircleAvatar(
              backgroundImage: const AssetImage(AssetsApp.img),
              radius: 70.r,
            ),
            Positioned(
                bottom: 0.h,
                right: 0.w,
                child: Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
          ]),
           SizedBox(
            height: 20.h,
          ),
          const Divider(),
          ListTile(
            title: Text(
              "Name",
              style: StylesApp.textStyle21
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.grey[700]),
            ),
            subtitle: Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Material(
                elevation: 30,
                shadowColor: Colors.grey[400],
                borderRadius: BorderRadius.circular(30.r),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Marwan Ali",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      )),
                ),
              ),
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          ListTile(
            title: Text(
              "Phone",
              style: StylesApp.textStyle21
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.grey[700]),
            ),
            subtitle: Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Material(
                elevation: 30,
                shadowColor: Colors.grey[400],
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "+20091877738",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      )),
                ),
              ),
            ),
          ),
           SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                     SizedBox(width: 10.w,),
                    Text(
                      "Save",
                      style: StylesApp.textStyle21.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
