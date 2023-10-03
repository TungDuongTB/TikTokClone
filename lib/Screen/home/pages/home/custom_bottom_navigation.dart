import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
    required this.selectPageIndex,
    required this.onIconTap,
  }) : super(key: key);

  final int selectPageIndex;
  final Function onIconTap;

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.06;
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 11,fontWeight: FontWeight.w600);
    return DefaultTextStyle(
      style: TextStyle(
        color: selectPageIndex == 0 ? Colors.white : CupertinoColors.black,
      ),
      child: CupertinoTabBar(
        backgroundColor: selectPageIndex == 0 ? CupertinoColors.black : Colors.white,
        activeColor: CupertinoColors.systemGrey,
        items: [
          _bottomBarNavItem(0, 'Home', style, CupertinoIcons.home),
          _bottomBarNavItem(1, 'Chat', style, CupertinoIcons.chat_bubble_text),
          _addVideoNavItem(barHeight),
          _bottomBarNavItem(3, 'Friend', style, CupertinoIcons.person_3_fill),
          _bottomBarNavItem(4, 'Profile', style, CupertinoIcons.person),
          // Thêm các tab khác ở đây
        ],
        onTap: (index) => onIconTap(index),
      ),
    );
  }

  BottomNavigationBarItem _bottomBarNavItem(
      int index,
      String label,
      TextStyle textStyle,
      IconData iconData,
      ) {
    bool isSelected = selectPageIndex == index;
    Color iconAndTextColor =
    isSelected ? CupertinoColors.black : CupertinoColors.systemGrey;
    if (isSelected && selectPageIndex == 0) {
      iconAndTextColor = Colors.white;
    }
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: iconAndTextColor,
      ),
      label: label,
    );
  }

   _addVideoNavItem(double height) {
    return BottomNavigationBarItem(
      icon: Container(
        child: SizedBox(
          width: 46,
          height: 32,
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(left: 12),
              width: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 12),
              width: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Center(
              child: Container(
                height: double.infinity,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            )
          ]),
        ),
      )
    );
  }
}
