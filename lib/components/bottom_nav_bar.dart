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
      items: [
        _buildBottomNavigationBarItem(
          tooltip: 'Discuss',
        ),
        _buildBottomNavigationBarItem(
          tooltip: 'Home',
        ),
        _buildBottomNavigationBarItem(
          tooltip: 'Profile',
        ),
      ],
    );
  }

  _buildBottomNavigationBarItem({
    @required tooltip,
  }) {
    return BottomNavigationBarItem(icon: Icon(Icons.home), label: tooltip);
  }
}