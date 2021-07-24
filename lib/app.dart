import 'package:flutter/material.dart';
import 'package:hacktable/components/bottom_nav_bar.dart';
import 'package:hacktable/pages/map_feature/map_page.dart';
import 'package:hacktable/pages/sos/sos_landing.dart';
import 'package:hacktable/pages/discussions/discussions_landing.dart';
import 'package:hacktable/playground/playground.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:hacktable/utils/router.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  void _selectTab(int _index) {
    setState(() {
      _tabController.index = _index;
    });
    print(_tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.AppBarBackground,
        title: Text('Voice Up'),
        elevation: 5.0,
        actions: [
          IconButton(
            icon: Icon(Icons.face_rounded),
            onPressed: () => Navigator.pushNamed(context, PROFILE_PAGE),
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar:
          NavigationBar(onTap: _selectTab, currentIndex: _tabController.index),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [MapPage(), SOSLandingPage(), DiscussionsLanding()],
    );
  }
}
