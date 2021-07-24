import 'package:flutter/material.dart';
import 'package:hacktable/components/bottom_nav_bar.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  int _counter = 0;

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
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
    /// https://willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
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
      children: [Placeholder(), Placeholder(), Placeholder()],
    );
  }
}
