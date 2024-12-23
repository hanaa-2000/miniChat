import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/home/presentation/viewModel/home_cubit.dart';
import 'package:minichat_project/features/home/presentation/viewModel/home_services.dart';

import '../../../../../core/constants/assets_app.dart';
import '../../../../../core/themes/colors.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool isRead = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeServices()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: FutureBuilder(
            future: firebaseFirestore
                .collection(userCollection)
                .doc(currentUser!.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Not Found Data"),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              // if (state is UploadImageLoading ||
              //     state is UpdateProfileLoading) {
              //   return Center(child: CircularProgressIndicator());
              // }
              if (snapshot.hasData) {
                var users = snapshot.data;
                nameController.text = users!['name'] ?? '';
                phoneController.text = users['phone'] ?? '';

                return Column(
                  children: [
                    const Divider(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Stack(children: [
                      CircleAvatar(
                        backgroundImage: state is UploadImageSuccess
                            ? NetworkImage(state.imageUrl)
                            : (users['profileImage'] != null
                                ? NetworkImage(users['profileImage'])
                                : const AssetImage(AssetsApp.img)
                                    as ImageProvider),
                        radius: 70.r,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() => isRead = true);
                            context.read<HomeCubit>().toggleEditMode(true);
                            context.read<HomeCubit>().uploadProfileImage(
                                userId: currentUser!.uid,
                                source: ImageSource.gallery);
                          },
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
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Divider(),
                    ListTile(
                      title: Text(
                        'Name',
                        style: StylesApp.textStyle21.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700]),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Material(
                          elevation: 30,
                          shadowColor: Colors.grey[400],
                          borderRadius: BorderRadius.circular(30.r),
                          child: TextField(
                            controller: nameController..text = users['name'],
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                hintText: users['name'],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                contentPadding: EdgeInsets.only(left: 20.w)),
                            readOnly: !isRead,
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
                        style: StylesApp.textStyle21.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[700]),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Material(
                          elevation: 30,
                          shadowColor: Colors.grey[400],
                          borderRadius: BorderRadius.circular(30),
                          child: TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                hintText: users['phone'],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                contentPadding: EdgeInsets.only(left: 20.w)),
                            readOnly: !isRead,
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
                          onPressed: () {
                            context.read<HomeCubit>().updateProfile(
                                  userId: currentUser!.uid,
                                  userName: nameController.text,
                                  phone: phoneController.text,
                                );
                            context.read<HomeCubit>().toggleEditMode(false);
                            setState(() => isRead = false);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsApp.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.save,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Save",
                                style: StylesApp.textStyle21.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text("Nothings data"),
                );
              }
            },
          ));
        },
      ),
    );
  }
}
