import 'package:flutter/material.dart';
import 'package:hacktable/components/bottom_nav_bar.dart';
import 'package:hacktable/pages/map_feature/incidents_map_page.dart';
import 'package:hacktable/pages/map_feature/map_page.dart';
import 'package:hacktable/pages/map_feature/map_page_web.dart';
import 'package:hacktable/pages/sos/sos_landing.dart';
import 'package:hacktable/pages/discussions/discussions_landing.dart';
import 'package:hacktable/playground/playground.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:hacktable/utils/router.dart';

class WebApp extends StatefulWidget {
  WebApp({Key key}) : super(key: key);

  @override
  _WebAppState createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 1);
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
      body: _buildBody(),
      // bottomNavigationBar: NavigationBar(
      //   onTap: _selectTab,
      //   currentIndex: _tabController.index,
      //   isWeb: true,
      // ),
    );
  }

  Widget _buildBody() {
    return IncidentsMapLanding();
    // return TabBarView(
    //   controller: _tabController,
    //   physics: NeverScrollableScrollPhysics(),
    //   children: [IncidentsMapLanding(), DiscussionsLanding()],
    // );
  }
}
