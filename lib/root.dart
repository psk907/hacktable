import 'package:flutter/material.dart';
import 'package:hacktable/pages/intro_screen.dart';
import 'package:hacktable/pages/splash_screen.dart';
import 'package:hacktable/services/permission_service.dart';
import 'package:hacktable/utils/enums.dart';
import 'package:provider/provider.dart';

import 'app.dart';

/// Utility class which conditionally renders the app's root view
/// based on the Permissions state
///
/// Requires the PermissionsService Provider to be initialized
class Root {
  getHome() {
    return Builder(
      builder: (context) {
        /// Watch for changes to [permissionState] from the respective ChangeNotifier
        switch (context.watch<PermissionService>().permissionState) {
          case PermissionState.granted:
            return App();
            break;
          case PermissionState.notGranted:
            return IntroScreen();
            break;
          default:
            break;
        }
        return SplashScreen();
      },
    );
  }
}
