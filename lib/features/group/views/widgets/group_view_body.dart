import 'package:flutter/material.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/features/group/views/widgets/chat_group_screen.dart';

class GroupViewBody  extends StatelessWidget {
  const GroupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: StreamBuilder(
          stream: firebaseFirestore.collection(groupCollection).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Text('No Groups found, Try add a group'));
            }

            var groups = snapshot.data!.docs;

            return ListView.builder(
              itemCount: groups.length -1 ,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var group = groups[index].data()as Map<String, dynamic>;;
                String groupId = group['groupId'] ?? 'No group Id';
                String groupName = group['groupName'] ?? 'No group name';
                List<dynamic> groupParticipants =
                    group['participants'] ?? 'No Group Participants';
                bool isCurrentEmailParticipant =
                groupParticipants.contains(currentUser!.email);
                if (isCurrentEmailParticipant == true) {
                  return const SizedBox.shrink();
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatGroupScreen(
                          groupId: groupId,
                          groupName: groupName,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: Icon(
                       Icons.groups ,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    title: Text(groupName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.group,
                            color: Colors.blueGrey, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          groupParticipants[0],
                          style: const TextStyle(color: Colors.blueGrey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );



          },
      ),
    );
  }
}
