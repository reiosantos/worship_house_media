import 'package:whm/src/models/menu.dart';
import 'package:whm/src/resources/menu_provider.dart';

class Repository {
  final MenuProvider menuProvider = MenuProvider();

  Future<Menu> fetchMenuItems() => menuProvider.fetchMenu();
}