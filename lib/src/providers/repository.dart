import 'package:whm/src/providers/menu_provider.dart';

class Repository {
  final MenuProvider menuProvider = MenuProvider();

  Future<List<String>> fetchMenuItems() => menuProvider.fetchMenu();
}
