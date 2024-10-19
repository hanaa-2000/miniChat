import 'package:flutter/material.dart';
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
          const SizedBox(
            height: 20,
          ),
          Stack(children: [
            const CircleAvatar(
              backgroundImage: AssetImage(AssetsApp.img),
              radius: 70,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 35,
                  height: 35,
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
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          ListTile(
            title: Text(
              "Name",
              style: StylesApp.textStyle21
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.grey[700]),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Material(
                elevation: 30,
                shadowColor: Colors.grey[400],
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Marwan Ali",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              "Phone",
              style: StylesApp.textStyle21
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.grey[700]),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Material(
                elevation: 30,
                shadowColor: Colors.grey[400],
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "+20091877738",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10,),
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
