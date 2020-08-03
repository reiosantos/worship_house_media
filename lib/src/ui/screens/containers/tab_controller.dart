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

final _navIcons = [
  Icon(Icons.home),
  Icon(Icons.people_outline),
  Icon(Icons.ondemand_video),
  Icon(Icons.notifications_none),
  Icon(Icons.person_outline),
  Icon(Icons.menu),
];

final _iosNavIcons = [
  Icon(CupertinoIcons.home),
  Icon(CupertinoIcons.group),
  Icon(CupertinoIcons.play_arrow),
  Icon(CupertinoIcons.bell),
  Icon(CupertinoIcons.profile_circled),
  Icon(CupertinoIcons.ellipsis),
];

final List<Widget> navPages = [
  HomePage(),
  PeoplePage(),
  VideoPage(),
  NotificationPage(),
  UserPage(),
  SettingPage()
];

final navIcons = Platform.isIOS ? _iosNavIcons : _navIcons;

// ignore: must_be_immutable
class SanBottomNavigation extends StatefulWidget {
  SanBottomNavigation({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SanBottomNavigation();
}

class _SanBottomNavigation extends State<SanBottomNavigation> {
  ThemeData _androidTheme;
  CupertinoThemeData _iosTheme;
  PageController pageController = PageController();

  int currentIndex = 0;

  final List<BottomNavigationBarItem> tabs = navIcons.map((Widget icon) {
    return BottomNavigationBarItem(icon: icon, title: Container());
  }).toList();

  void _onPressSearch() {
    navigationProvider.navigateToNamed(
      Routes.SEARCH_ROUTE[0],
      args: ScreenArguments(Routes.SEARCH_ROUTE[1]),
    );
  }

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void iosOnTap(int index) {
    onPageChanged(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
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
        currentIndex: currentIndex,
        onTap: iosOnTap,
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
              child: navPages[index],
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
          body: PageView(
            controller: pageController,
            children: navPages,
            onPageChanged: onPageChanged,
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: appBarTheme.color,
            selectedIconTheme: appBarTheme.iconTheme,
            unselectedIconTheme: appBarTheme.iconTheme.copyWith(
              color: Colors.grey,
            ),
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: onTap,
            items: tabs,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _iosTheme = CupertinoTheme.of(context);
    _androidTheme = Theme.of(context);

    if (Platform.isIOS) {
      return _ios(context);
    }
    return _android(context);
  }
}
