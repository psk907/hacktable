import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacktable/root.dart';
import 'package:hacktable/servicelocator.dart';
import 'package:hacktable/services/permission_service.dart';
import 'package:hacktable/themeconfig.dart';
import 'package:hacktable/utils/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  createLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PermissionService.instance(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackTable',
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      home: Root().getHome(),
      //home: Playground(),
      theme: ThemeData(
        textTheme: GoogleFonts.muktaTextTheme(), //TODO: CHOSE FONT
      ),
      onGenerateRoute: RouterThing.generateRoute,
      scrollBehavior: ScrollWithoutMaterialOverflowGlow(),
    );
  }
}
