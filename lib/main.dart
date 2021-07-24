import 'package:flutter/material.dart';
import 'package:hacktable/components/bottom_nav_bar.dart';
import 'package:hacktable/servicelocator.dart';
import 'package:hacktable/themeconfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  createLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ignite',
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      home: MyHomePage(),
      scrollBehavior: ScrollWithoutMaterialOverflowGlow(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
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
