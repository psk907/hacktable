import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBar extends StatelessWidget {
  final Function(int) onTap;

  final int currentIndex;

  const NavigationBar({
    Key key,
    @required this.onTap,
    @required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.map_rounded),
          label: "Map",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_rounded),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.mic_rounded),
          label: "Discuss",
        ),
      ],
    );
  }
}
