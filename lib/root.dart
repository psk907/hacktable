import 'package:flutter/material.dart';
import 'package:hacktable/pages/intro_screen.dart';
import 'package:hacktable/pages/splash_screen.dart';
import 'package:hacktable/services/permission_service.dart';
import 'package:hacktable/utils/enums.dart';
import 'package:hacktable/web_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

import 'app.dart';

/// Utility class which conditionally renders the app's root view
/// based on the Permissions state
///
/// Requires the PermissionsService Provider to be initialized
class Root {
  bool _isMobile(TargetPlatform platform) {
    return platform == TargetPlatform.android || platform == TargetPlatform.iOS;
  }

  getHome(TargetPlatform platform) {
    return Builder(
      builder: (context) {
        print(_isMobile(platform));

        /// Watch for changes to [permissionState] from the respective ChangeNotifier
        switch (context.watch<PermissionService>().permissionState) {
          case PermissionState.granted:
            if (_isMobile(platform))
              return App();
            else
              return WebApp();
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
