import 'package:whm/src/blocs/theme/bloc.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/providers/navigator_provider.dart';
import 'package:whm/src/providers/service_locator.dart';
import 'package:whm/src/ui/screens/containers/tab_controller.dart';
import 'package:whm/src/utilities/constants.dart';

import 'routes.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  Widget _iosApp(ChangeThemeState state) {
    return CupertinoApp(
      title: APP_TITLE,
      theme: state.themeData as CupertinoThemeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      routes: routes,
      navigatorKey: locator<NavigationProvider>().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SanBottomNavigation(),
    );
  }

  Widget _androidApp(ChangeThemeState state) {
    return MaterialApp(
      title: APP_TITLE,
      theme: state.themeData as ThemeData,
      debugShowCheckedModeBanner: false,
      routes: routes,
      navigatorKey: locator<NavigationProvider>().navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: SanBottomNavigation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context1) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context2, state) {
          return Material(
            child: (() {
              if (Platform.isIOS) {
                return _iosApp(state as ChangeThemeState);
              }
              return _androidApp(state as ChangeThemeState);
            })(),
          );
        },
      ),
    );
  }
}
