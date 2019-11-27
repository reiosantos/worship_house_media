import 'package:whm/src/index.dart';
import 'package:whm/src/screens/home_page.dart';
import 'package:whm/src/theme/whm_theme.dart';
import 'package:whm/src/utilities/constants.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: AppTheme().createWhmTheme(),
      home: const HomePage(),
    );
  }
}
