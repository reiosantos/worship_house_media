import 'package:whm/src/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:whm/src/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:whm/src/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/ui/screens/components/theme_switch.dart';
import 'package:whm/src/ui/screens/home.dart';
import 'package:whm/src/ui/screens/notifications.dart';
import 'package:whm/src/ui/screens/people.dart';
import 'package:whm/src/ui/screens/settings.dart';
import 'package:whm/src/ui/screens/user.dart';
import 'package:whm/src/ui/screens/videos.dart';
import 'package:whm/src/utilities/constants.dart';

final navItems = [
  // [Icon, Title, Page]
  [Icon(Icons.home), Container(), HomePage()],
  [Icon(Icons.people), Container(), PeoplePage()],
  [Icon(Icons.video_library), Container(), VideoPage()],
  [Icon(Icons.notifications), Container(), NotificationPage()],
  [Icon(Icons.person), Container(), UserPage()],
  [Icon(Icons.menu), Container(), SettingPage()],
];

const ICON_IDX = 0;
const TITLE_IDX = 1;
const PAGE_IDX = 2;

// ignore: must_be_immutable
class SanBottomNavigation extends StatefulWidget {
  SanBottomNavigation({Key key}) : super(key: key);

  int _selectedPage;

  @override
  State<StatefulWidget> createState() => _SanBottomNavigation();
}

class _SanBottomNavigation extends State<SanBottomNavigation> {
  BottomNavigationBloc _bottomNavigationBloc;

  final List<BottomNavigationBarItem> tabs = navItems.map((List<Widget> item) {
    return BottomNavigationBarItem(
      icon: item[ICON_IDX],
      title: item[TITLE_IDX],
    );
  }).toList();

  Widget _ios(BuildContext context) {
    var theme = CupertinoTheme.of(context);

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: theme.barBackgroundColor,
        activeColor: theme.textTheme.textStyle.color,
        items: tabs,
        onTap: (int index) {
          _bottomNavigationBloc.add(BottomNavigationEventImpl(index));
        },
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context1) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(APP_TITLE),
                leading: ThemeSwitch(),
              ),
              child: navItems[index][PAGE_IDX],
            );
          },
        );
      },
    );
  }

  Widget _android(BuildContext context) {
    var appBarTheme = Theme.of(context).appBarTheme;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        primary: true,
        resizeToAvoidBottomInset: false,
        body: Scaffold(
          appBar: AppBar(
            leading: ThemeSwitch(),
            title: Center(child: Text(APP_TITLE)),
          ),
          body: navItems[widget._selectedPage][PAGE_IDX],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: appBarTheme.color,
            selectedIconTheme: appBarTheme.iconTheme,
            unselectedIconTheme: appBarTheme.iconTheme.copyWith(
              color: Colors.grey,
            ),
            type: BottomNavigationBarType.fixed,
            currentIndex: widget._selectedPage,
            onTap: (int index) {
              _bottomNavigationBloc.add(BottomNavigationEventImpl(index));
            },
            items: tabs,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationBloc = context.bloc<BottomNavigationBloc>();

    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        var _state = state as InitialBottomNavigationState;
        widget._selectedPage = _state.selectedTab;

        if (Platform.isIOS) {
          return _ios(context);
        }
        return _android(context);
      },
    );
  }
}
