import 'package:whm/src/blocs/menu/menu_bloc.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/screens/containers/main_frame.dart';
import 'package:whm/src/theme/whm_theme.dart';
import 'package:whm/src/utilities/constants.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (BuildContext context) => MenuBloc(),
      child: MaterialApp(
        title: APP_TITLE,
        theme: AppTheme().createWhmTheme(),
        home: BlocBuilder<MenuBloc, MenuState>(
          builder: (BuildContext context, MenuState state) {
            return WhmMainFrame(
              body: Container(
                child: Text(state.title, style: Theme.of(context).textTheme.display1),
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              ),
            );
          },
        ),
      ),
    );
  }
}
