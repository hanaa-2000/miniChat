import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/core/services/models/message_model.dart';
import 'package:minichat_project/features/chats/presentation/viewModel/repo/firebase_services.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit(this.firebaseService,  ) : super(ChatsInitial());
  final FirebaseServices firebaseService;



  void loadMessages(String chatId) {
    try{
      emit(ChatsLoading());
      firebaseService.getMessage(chatId).listen((dataMessages) {
        if (dataMessages.isNotEmpty) {
          emit(ChatsSuccess(messages: dataMessages));
        } else {
         print('No messages found, start a conversation');
          emit(ChatsFailure (mesError:
              'No messages found, start a conversation'));
        }
      }

      );
    }catch (e){
      print('error while loading messages: $e');
      emit(ChatsFailure(mesError: e.toString()));
    }

  }
  String formatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDay = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (messageDay == today) {
      return DateFormat('hh:mm a').format(dateTime);
    } else if (messageDay == today.subtract(const Duration(days: 1))) {
      return 'Yesterday, ${DateFormat('hh:mm a').format(dateTime)}';
    } else {
      return DateFormat('MMM d, hh:mm a').format(dateTime);
    }
  }
  void sendMessage(String senderId, String text ,String chatId) {
    if(text.isNotEmpty){
      emit(SendMessageLoading());
      final message = MessageModel(
        senderId: senderId,
        messageTxt: text,
        timeStamp: DateTime.now(),
      );
      firebaseService.sendMessage(chatId, message).catchError((e){
        emit(SendMessageFailure(e.toString()));
      });
    }
  }

  String generateChatIdForUsers(String email1, String email2) {
    List<String> emails = [email1, email2];
    emails.sort();
    return emails.join('_');
  }

  void loadGroupMessages(String groupId) {
    try {
      emit(GroupMessagesLoading());
      firebaseService.getGroupMessage(groupId).listen(
            (messages) {
          if (messages.isNotEmpty) {
            emit(GroupMessagesSuccess(messages));
          } else {
            print('No messages found, start a group conversation');
            emit( GroupMessagesFailure(
                'No messages found, start a group conversation'));
          }
        },
      );
    } catch (error) {
      print('error while loading conversation messages: $error');
      emit(GroupMessagesFailure(error.toString()));
    }
  }

  void sendGroupMessage(String groupId, String text, String sender) {
    if (text.isNotEmpty) {
      emit(SendMessageLoading());
      final message = MessageModel(
        senderId: sender,
        messageTxt: text,
        timeStamp: DateTime.now(),
      );
      firebaseService.sendGroupMessage(groupId, message).catchError(
            (error) => emit(SendMessageFailure(error.toString())),
      );
    }
  }
  void loadChatUsers() async {
    emit(ChatsLoading());
    try {
      final users = await firebaseService.getUsersWithMessages();
      emit(ChatsLoadedSuccess(users: users));
    } catch (e) {
      emit(ChatsFailure(mesError: e.toString()));
    }
  }
  //   void getAllUser() async {
  //   emit(UsersLoading());
  //   try {
  //     final users = await firebaseService.getAllUsers();
  //     emit(UsersSuccess(users: users));
  //   } catch (e) {
  //     emit(UsersFailure(mesError: e.toString()));
  //   }
  // }


  //  String generateChatId() {
  //   final random = Random();
  //   return 'chat_${random.nextInt(1000000)}';
  // }
}
