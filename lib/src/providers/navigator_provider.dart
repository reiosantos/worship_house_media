import 'package:whm/src/index.dart';
import 'package:whm/src/providers/service_locator.dart';
import 'package:whm/src/utilities/constants.dart';

class NavigationProvider {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateToNamed(String routeName, {ScreenArguments args}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: args);
  }

  void goBack() {
    if (navigatorKey.currentState.canPop()) {
      return navigatorKey.currentState.pop();
    }
  }

  void pop() {
    goBack();
  }
}

// Use this to navigate to any page in the app, Avoid using the default Navigator utilities
final NavigationProvider navigationProvider = locator<NavigationProvider>();
