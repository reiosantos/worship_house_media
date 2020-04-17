const String API_KEY = '802b2c4b88ea1183e50e6b285a27696e';
const String MAIN_IMG =
    'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

const String APP_TITLE = 'Worship House Minstries';
const String WHM_IMG = 'assets/images/wh.jpg';

enum ThemeSwitchMode { LIGHT, DARK, SYSTEM }

class ScreenArguments {
  final String title;

  ScreenArguments(this.title);
}

class Routes {
  static const List<String> HOME_ROUTE = ['/home', 'Home'];
  static const List<String> LOGIN_ROUTE = ['/login', 'Login'];
}
