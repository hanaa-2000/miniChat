import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/core/services/models/message_model.dart';

class FirebaseServices {
  Stream<List<MessageModel>> getMessage(String chatId) {
    return firebaseFirestore
        .collection(chatsCollection)
        .doc(chatId)
        .collection(messagesCollection)
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(
        (doc) {
          return MessageModel.fromJson(doc.data());
        },
      ).toList();
    });
  }

  Stream<List<MessageModel>> getGroupMessage(String groupCatId) {
    return firebaseFirestore
        .collection(groupCollection)
        .doc(groupCatId)
        .collection(messagesCollection)
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            return MessageModel.fromJson(doc.data());
          },
        ).toList();
      },
    );
  }

  Future<void> sendMessage(String chatId, MessageModel message) async {
    await firebaseFirestore
        .collection(chatsCollection)
        .doc(chatId)
        .collection(messagesCollection)
        .add(message.toJson());
  }

  Future<void> sendGroupMessage(
      String groupChatId, MessageModel messages) async {
    await firebaseFirestore
        .collection(groupCollection)
        .doc(groupChatId)
        .collection(messagesCollection)
        .add(messages.toJson());
  }

  // String generateChatIdForUsers(String email1, String email2) {
  //   List<String> emails = [email1, email2];
  //   emails.sort();
  //   return emails.join('_');
  // }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final querySnapshot = await firebaseFirestore
        .collection(userCollection)
        .where('email', isNotEqualTo: currentUser!.email)
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }



  Future<List<Map<String, dynamic>>> getUsersWithMessages() async {

    // Query messages where the current user is either a sender or a receiver
    final querySnapshot = await firebaseFirestore
        .collection(messagesCollection) // Search across all messages sub-collections
        .where('senderId', isEqualTo: currentUser!.email)
        .get();

    Set<String> userIds = {};

    // Collect unique user IDs
    for (var doc in querySnapshot.docs) {
      final messageData = doc.data();
      final recipientId = messageData['recipientId'] as String?;
      if (recipientId != null && recipientId != currentUser!.email) {
        userIds.add(recipientId);
      }
    }

    // Fetch user details
    List<Map<String, dynamic>> usersWithMessages = [];
    for (var userId in userIds) {
      final userDoc = await firebaseFirestore.collection(userCollection).doc(userId).get();
      if (userDoc.exists) {
        usersWithMessages.add(userDoc.data() as Map<String, dynamic>);
      }
    }

    return usersWithMessages;
  }


}
