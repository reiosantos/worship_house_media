import 'package:whm/src/index.dart';
import 'package:whm/src/utilities/constants.dart';

class NavigationProvider {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {ScreenArguments args}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: args);
  }
}
