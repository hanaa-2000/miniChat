import 'package:flutter/material.dart';
import 'package:minichat_project/core/themes/colors.dart';
import 'package:minichat_project/core/themes/styles.dart';
import 'package:minichat_project/features/calls/presentation/views/call_screen.dart';
import 'package:minichat_project/features/home/presentation/views/home_screen.dart';
import 'package:minichat_project/features/home/presentation/views/widgets/bottom_nav_item.dart';
import 'package:minichat_project/features/status/presentation/views/status_screen.dart';

class BottomNavWidget  extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {

  int currentIndex =0;
  List<Widget> pages=[
    const HomeScreen(),
    const StatusScreen(),
    const CallScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: Colors.transparent,
          selectedItemColor: ColorsApp.green,
          unselectedLabelStyle: StylesApp.textStyle16.copyWith(color: ColorsApp.grey),
          onTap: (value) {
            setState(() {
              currentIndex=value;
            });
          },
          elevation: 0,
          selectedFontSize: 18,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: [
            bottomNavBarItem(icon: Icons.chat,label: "Chats"),
            bottomNavBarItem(icon: Icons.lightbulb,label: "Status"),
            bottomNavBarItem(icon: Icons.call,label: "Calls"),
          ]),
      body: pages[currentIndex],
    ) ;
  }
}
