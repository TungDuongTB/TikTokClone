import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/Screen/home/video/add_video_page.dart';
import 'package:tiktok/Screen/home/pages/friend_page.dart';
import 'package:tiktok/Screen/home/pages/home/Home.dart';
import 'package:tiktok/Screen/home/pages/inbox_page.dart';
import 'package:tiktok/Screen/home/pages/profile/profile_page.dart';

import 'custom_bottom_navigation.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex= 0;

  static const List<Widget> _pages=[
    HomeScreen(),
    InboxScreen(),
    AddVideo(),
    FriendScreen(),
    ProfileScreen(),

  ];
  void _onIconTapped(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _pages[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectPageIndex:_selectedPageIndex,onIconTap:_onIconTapped,
      ),

    );
  }
}

