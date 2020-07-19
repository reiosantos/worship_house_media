import 'package:whm/src/index.dart';
import 'package:whm/src/models/VideoPost.dart';
import 'package:whm/src/ui/screens/components/platform_wrapper.dart';
import 'package:whm/src/ui/screens/pages/home/home.dart';
import 'package:whm/src/ui/screens/pages/route_not_found.dart';
import 'package:whm/src/ui/screens/pages/videos/video_details.dart';
import 'package:whm/src/utilities/constants.dart';

Widget _wrapper(Widget page, {String title}) {
  return PlatformWrapper(page: page, title: title);
}

PageRoute _pageRoute(Widget page, {String title}) {
  if (Platform.isIOS) {
    return CupertinoPageRoute<dynamic>(
      builder: (BuildContext context) => _wrapper(page, title: title),
    );
  }
  return MaterialPageRoute<dynamic>(
    builder: (BuildContext context) => _wrapper(page, title: title),
  );
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // Routes with arguments in the constructor are put here to extract the arguments
  // before we move to the widget
  final args = settings.arguments as ScreenArguments;

  if (settings.name == Routes.VIDEO_DETAILS_ROUTE[0]) {
    return _pageRoute(
      VideoDetailsPage(args.extraArgs['videoPost'] as VideoPost),
      title: args.title,
    );
  }
  return _pageRoute(RouteNotFound(name: settings.name), title: args.title);
}

// Add app DYNAMIC routes here -- Routes without arguments in the constructor are put here
Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  Routes.HOME_ROUTE[0]: (BuildContext context) =>
      _wrapper(HomePage(), title: Routes.HOME_ROUTE[1]),
};
