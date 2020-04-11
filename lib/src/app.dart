import 'package:whm/src/index.dart';
import 'package:whm/src/providers/navigator_provider.dart';
import 'package:whm/src/providers/service_locator.dart';
import 'package:whm/src/theme/theme.dart';
import 'package:whm/src/ui/screens/containers/tab_controller.dart';
import 'package:whm/src/utilities/constants.dart';

import 'routes.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  Widget _iosApp() {
    return CupertinoApp(
      title: APP_TITLE,
      theme: AppTheme().createTheme() as CupertinoThemeData,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      routes: routes,
      navigatorKey: locator<NavigationProvider>().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SanTabController(),
    );
  }

  Widget _androidApp() {
    return MaterialApp(
      title: APP_TITLE,
      theme: AppTheme().createTheme() as ThemeData,
      routes: routes,
      navigatorKey: locator<NavigationProvider>().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SanTabController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _iosApp();
    }
    return _androidApp();
  }
}
