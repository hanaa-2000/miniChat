import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minichat_project/features/home/presentation/viewModel/home_cubit.dart';

import '../../../../core/constants/firebase_consts.dart';
import '../../../../core/shared_widgets/functions_helper.dart';
import '../../../chats/presentation/viewModel/chats_cubit/chats_cubit.dart';
import '../../../chats/presentation/views/widgets/bubble_chat_widget.dart';
import '../../../group/views/widgets/chat_group_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String search = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchController.text = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search...",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      context.read<HomeCubit>().searchGroup(searchController.text);
                      context.read<HomeCubit>().searchUsers(searchController.text);
                    }

                   searchController.clear();

                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is UserDataLoading || state is GroupSearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserDataSuccess) {
                    final users = state.filteredUsers;
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          onTap: () {
                            String chatId = BlocProvider.of<ChatsCubit>(context)
                                .generateChatIdForUsers(
                                    currentUser!.email!, user.email);
                            navigatorApp(
                                context: context,
                                widget: BubbleChatWidget(
                                  userName: user.name,
                                  phone: user.phone,
                                  email: user.email,
                                  chatId: chatId,
                                ));
                          },
                          leading: const CircleAvatar(
                            backgroundColor: Colors.black12,
                            radius: 24,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          trailing: Text(user.phone),
                        );
                      },
                    );
                  } else if (state is GroupSearchSuccess) {
                    final groups = state.groups;
                    return ListView.builder(
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> group = groups[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatGroupScreen(
                                  groupId: group["groupId"],
                                  groupName: group["groupName"],
                                ),
                              ),
                            );
                          },
                          leading: const CircleAvatar(
                            backgroundColor: Colors.black45,
                            radius: 24,
                            child: Icon(
                              Icons.groups,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(group["groupName"]),
                          subtitle: Row(
                            children: [
                              const Icon(
                                Icons.group,
                                color: Colors.black12,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(group["participants"][0]),
                            ],
                          ),
                          // trailing: Text(user.phone),
                        );
                      },
                    );
                  } else if (state is UserDataFailure ) {
                    return Center(child: Text(state.msgError));
                  }
                  // else if (state is GroupSearchFailure) {
                  //   return Center(child: Text(state.msgError));
                  // }
                  else {
                    return const Center(
                        child: Text("Start typing to search ."));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
