part of 'chats_cubit.dart';

@immutable
sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}

final class ChatsLoading extends ChatsState {}

final class ChatsSuccess extends ChatsState {
 final List<MessageModel>  messages ;

  ChatsSuccess({required this.messages});
}
final class ChatsLoadedSuccess extends ChatsState {
  final List<Map<String,dynamic>>  users ;

  ChatsLoadedSuccess({required this.users});
}
final class ChatsFailure extends ChatsState {
  final String ? mesError;

  ChatsFailure({this.mesError});
}
class SendMessageLoading extends ChatsState {}

class SendMessageFailure extends ChatsState {
  final String errorMessage;

   SendMessageFailure(this.errorMessage);

}

final class UsersLoading extends ChatsState {}
final class UsersSuccess extends ChatsState {
  final List<Map<String, dynamic>> users;
  UsersSuccess({required this.users});

}
final class UsersFailure extends ChatsState {
  final String ? mesError;

  UsersFailure({this.mesError});
}


class GroupMessagesLoading extends ChatsState {}

class GroupMessagesSuccess extends ChatsState {
  final List<MessageModel> messages;

   GroupMessagesSuccess(this.messages);

 }

class GroupMessagesFailure extends ChatsState {
  final String errorMessage;

  GroupMessagesFailure(this.errorMessage);


}

class SendGroupMessageLoading extends ChatsState {}

class SendGroupMessageFailure extends ChatsState {
  final String errorMessage;

  SendGroupMessageFailure(this.errorMessage);

}

class SendGroupMessageSuccess extends ChatsState {}


