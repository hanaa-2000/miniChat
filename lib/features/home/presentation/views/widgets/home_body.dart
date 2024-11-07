import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minichat_project/core/shared_widgets/appbar_widget.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/calls/presentation/views/call_screen.dart';
import 'package:minichat_project/features/chats/presentation/views/chat_screen.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/bottom_nav_item.dart';
import 'package:minichat_project/features/status/presentation/views/status_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int currentIndex = 0;
  List<Widget> pages = [
    const ChatsScreen(),
     const StatusScreen(),
    const CallScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: ColorsApp.green,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          unselectedLabelStyle:
              StylesApp.textStyle16.copyWith(color: ColorsApp.grey),
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          elevation: 0,
          selectedFontSize: 18.sp,
          selectedLabelStyle:  TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
          items: [
            bottomNavBarItem(icon: Icons.chat, label: "Chats"),
            bottomNavBarItem(icon: Icons.lightbulb, label: "Status"),
            bottomNavBarItem(icon: Icons.call, label: "Calls"),
          ]),
      body: pages[currentIndex],
      appBar: AppbarWidget(),

    );
  }
}
