import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacktable/app.dart';
import 'package:hacktable/components/bottom_nav_bar.dart';
import 'package:hacktable/playground/playground.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackTable',
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      //home: App(),
      home: Playground(),
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      scrollBehavior: ScrollWithoutMaterialOverflowGlow(),
    );
  }
}
