import 'package:flutter/material.dart';
import 'package:hacktable/app.dart';
import 'package:hacktable/pages/profile/profile.dart';
import 'package:hacktable/pages/splash_screen.dart';

const PROFILE_PAGE = '/profile';
const HOME_PAGE = '/home';
const SPLASH_SCREEN = '/splash';
const DUMMY_SCREEN = '/dummy';

class RouterThing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      //uncomment and import screens as they are created
      // case '/':
      // return CustomRoute(page: Root());
      case HOME_PAGE:
        return CustomRoute(page: App());

      case SPLASH_SCREEN:
        return CustomRoute(page: SplashScreen());

      case PROFILE_PAGE:
        return CustomRoute(page: ProfilePage());

      // case '/Help':
      //   return CustomRoute( page:Help());

      case DUMMY_SCREEN:
        return CustomRoute(page: Placeholder());

      default:
        print("Page doesn't exist");
    }
  }
}

/// Renders a page transtion
/// SLIDE IN FROM RIGHT
///
/// Additional PageRoute arguments to be implemented below as and when needed
class CustomRoute extends PageRouteBuilder {
  final Widget page;

  CustomRoute({
    @required this.page,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: 250),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
