const String API_KEY = '802b2c4b88ea1183e50e6b285a27696e';
const String MAIN_IMG =
    'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

const String APP_TITLE = 'The Worship House';
const String WHM_IMG = 'assets/images/wh.jpg';

enum ThemeSwitchMode { LIGHT, DARK, SYSTEM }

class ScreenArguments {
  final String title;
  final Map<String, dynamic> extraArgs;

  ScreenArguments(this.title, {this.extraArgs});
}

class Routes {
  static const List<String> HOME_ROUTE = ['/home', 'Home'];
  static const List<String> LOGIN_ROUTE = ['/login', 'Login'];
  static const List<String> VIDEO_DETAILS_ROUTE = ['/video/details', 'Details'];
  static const List<String> SEARCH_ROUTE = ['/search', 'Search'];
}

const num DAYS_IN_A_YEAR = 356; // average number
const num DAYS_IN_A_MONTH = 30; // average days

const BASE_URL = '';
