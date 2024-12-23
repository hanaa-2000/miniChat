import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minichat_project/core/constants/assets_app.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/features/group/views/widgets/new_group_second_screen.dart';

class NewGroupBody  extends StatefulWidget {
  const NewGroupBody({super.key});

  @override
  State<NewGroupBody> createState() => _NewGroupBodyState();
}

class _NewGroupBodyState extends State<NewGroupBody> {
  List<Map<String, dynamic>> selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: firebaseFirestore.collection(userCollection).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No users found, Try add a users'));
              }
              var users = snapshot.data!.docs;

              return ListView.builder(
                itemCount: users.length,
                  itemBuilder: (context, index) {
                  var user = users[index].data()as Map<String, dynamic>;
                 String name = user['name'] ??  "No Name"  ;
                 String phone =user['phone']?? "No Phone";
                  String email =user['email']?? "No email";
                  String image = user['profileImage']??"";
                  if(email == currentUser!.email){
                    return SizedBox();
                  }
                  bool isSelected = selectedUsers.any((selectedUser) =>selectedUser['email']==email ,);
                    return InkWell(
                      onTap: () {
                        if (isSelected) {
                          selectedUsers.removeWhere(
                                  (selectedUser) => selectedUser['email'] == email);
                        } else {
                          selectedUsers.add(user);
                        }
                        setState(() {});
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:image == null?AssetImage(AssetsApp.img) :NetworkImage(image ),
                          radius: 35,
                        ),
                        title: Text(name,style: const TextStyle(fontWeight: FontWeight.bold)
                        ),
                        subtitle: Row(
                          children: [
                            const Icon(Icons.numbers,
                                color: Colors.blueGrey, size: 20),
                            const SizedBox(width: 5),
                            Text(
                              phone,
                              style: const TextStyle(color: Colors.blueGrey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        trailing: isSelected
                            ? const Icon(
                          Icons.check_box,
                          color: Colors.green,
                        )
                            : const Icon(
                          Icons.check_box_outline_blank,
                          color: Colors.grey,
                        ),


                      ),
                    );
                  },
              );

            },
        ),

        Positioned(
        bottom: 20,
          right: 20,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NewGroupSecondScreen(
                    selectedUsers: selectedUsers,
                  ),
                ),
              );
            },
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),


      ],
    );
  }
}
