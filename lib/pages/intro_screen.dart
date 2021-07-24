import 'package:flutter/material.dart';
import 'package:hacktable/services/permission_service.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You need to grant these permissions to use the app."),
          ElevatedButton(
            onPressed: () =>
                Provider.of<PermissionService>(context, listen: false)
                    .requestPermissions(),
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
