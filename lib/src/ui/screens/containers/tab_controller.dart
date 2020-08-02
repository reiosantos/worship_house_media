import 'package:whm/src/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:whm/src/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:whm/src/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/providers/navigator_provider.dart';
import 'package:whm/src/ui/screens/components/theme_switch.dart';
import 'package:whm/src/ui/screens/pages/home/home.dart';
import 'package:whm/src/ui/screens/pages/notifications/notifications.dart';
import 'package:whm/src/ui/screens/pages/people/people.dart';
import 'package:whm/src/ui/screens/pages/profile/user.dart';
import 'package:whm/src/ui/screens/pages/settings/settings.dart';
import 'package:whm/src/ui/screens/pages/videos/videos.dart';
import 'package:whm/src/utilities/constants.dart';

final _navItems = [
  // [Icon, Title, Page]
  [Icon(Icons.home), Container(), HomePage()],
  [Icon(Icons.people_outline), Container(), PeoplePage()],
  [Icon(Icons.ondemand_video), Container(), VideoPage()],
  [Icon(Icons.notifications_none), Container(), NotificationPage()],
  [Icon(Icons.person_outline), Container(), UserPage()],
  [Icon(Icons.menu), Container(), SettingPage()],
];

final _iosNavItems = [
  [Icon(CupertinoIcons.home), Container(), HomePage()],
  [Icon(CupertinoIcons.group), Container(), PeoplePage()],
  [Icon(CupertinoIcons.play_arrow), Container(), VideoPage()],
  [Icon(CupertinoIcons.bell), Container(), NotificationPage()],
  [Icon(CupertinoIcons.profile_circled), Container(), UserPage()],
  [Icon(CupertinoIcons.ellipsis), Container(), SettingPage()],
];

final navItems = Platform.isIOS ? _iosNavItems : _navItems;

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

// TODO(reiosantos): implement state cache when changing between tabs, a switch between tabs should maintain previous state if previously visited
class _SanBottomNavigation extends State<SanBottomNavigation> {
  BottomNavigationBloc _bottomNavigationBloc;
  ThemeData _androidTheme;
  CupertinoThemeData _iosTheme;

  final List<BottomNavigationBarItem> tabs = navItems.map((List<Widget> item) {
    return BottomNavigationBarItem(
      icon: item[ICON_IDX],
      title: item[TITLE_IDX],
    );
  }).toList();

  void _onPressSearch() {
    navigationProvider.navigateToNamed(
      Routes.SEARCH_ROUTE[0],
      args: ScreenArguments(Routes.SEARCH_ROUTE[1]),
    );
  }

  Widget _searchButton({Brightness brightness, Icon icon}) {
    if (Platform.isIOS) {
      return CupertinoButton(
        padding: EdgeInsets.all(0),
        child: Icon(
          CupertinoIcons.search,
          size: 22,
          color: _iosTheme.textTheme.textStyle.color,
        ),
        onPressed: _onPressSearch,
      );
    }
    return IconButton(
      padding: EdgeInsets.all(0),
      icon: Icon(
        Icons.search,
        size: 22,
      ),
      onPressed: _onPressSearch,
    );
  }

  Widget _ios(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: _iosTheme.barBackgroundColor,
        activeColor: _iosTheme.textTheme.textStyle.color,
        items: tabs,
        currentIndex: widget._selectedPage,
        onTap: (int index) {
          _bottomNavigationBloc.add(BottomNavigationEventImpl(index));
        },
      ),
      tabBuilder: (BuildContext context1, int index) {
        return CupertinoTabView(
          builder: (BuildContext context2) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: ThemeSwitch(),
                middle: Text(
                  APP_TITLE,
                  textScaleFactor: 1.0,
                  style: _iosTheme.textTheme.textStyle.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: _searchButton(),
              ),
              child: navItems[index][PAGE_IDX],
            );
          },
        );
      },
    );
  }

  Widget _android(BuildContext context) {
    var appBarTheme = _androidTheme.appBarTheme;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        primary: true,
        resizeToAvoidBottomInset: false,
        body: Scaffold(
          appBar: AppBar(
            leading: ThemeSwitch(),
            actions: <Widget>[
              _searchButton(),
            ],
            title: Center(
              child: Text(
                APP_TITLE,
                textScaleFactor: 1.5,
                style: appBarTheme.textTheme.headline6.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
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
    _iosTheme = CupertinoTheme.of(context);
    _androidTheme = Theme.of(context);

    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context1, state) {
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
