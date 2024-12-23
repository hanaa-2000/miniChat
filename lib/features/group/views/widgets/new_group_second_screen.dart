import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/features/group/views/widgets/chat_group_screen.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/firebase_consts.dart';

class  NewGroupSecondScreen  extends StatelessWidget {
    NewGroupSecondScreen({super.key, required this.selectedUsers});
  final List<Map<String, dynamic>> selectedUsers;
  final  TextEditingController groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.h),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: 20.h),
                Row(
                  children: [
                     CircleAvatar(
                      radius: 30.r,
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                     SizedBox(width: 20.w),
                    Expanded(
                      child: TextField(
                        controller: groupNameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter group name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Text(
                  'Participants',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedUsers.length,
                    itemBuilder: (context, index) {
                      var user = selectedUsers[index];
                      String name = user['name'] ?? 'No name';
                      String phone = user['phone'] ?? 'No phone';
                      String email = user['email'] ?? 'No email';
                      return ListTile(
                        leading: const CircleAvatar(),
                        title: Text(name),
                        subtitle: Text(phone),
                        trailing: Text(email),
                      );
                    },
                  ),
                ),

              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: ColorsApp.green,
                child: const Icon(
                  Icons.check_outlined,
                  color: Colors.white,
                ),
                onPressed:() async {
                  String groupId =Uuid().v4();

                  await FirebaseFirestore.instance
                      .collection(groupCollection)
                      .doc(groupId)
                      .set({
                    'groupId': groupId,
                    'groupName': groupNameController.text,
                    'participants':
                    selectedUsers.map((user) => user['email']).toList(),
                    'timeStamp': DateTime.now(),
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatGroupScreen(
                        groupId: groupId,
                        groupName: groupNameController.text,
                      ),
                    ),
                  );
                },
              ),),
          ],
        ),


      ),

    );
  }
}
