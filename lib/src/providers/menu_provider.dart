import 'package:whm/src/index.dart';
import 'package:whm/src/models/menu.dart';

class MenuProvider implements IMenu {
  @override
  List<String> menu = <String>[
    'who_we_are',
    'information',
    'sermons',
    'stream'
  ];

  @override
  Future<List<String>> fetchMenu() async {
    // implement logic to fetch menu from server asynchronously;
    return menu;
  }

  @override
  Widget information() {
    // TODO(santos): implement information
    return null;
  }

  @override
  Widget whoWeAre() {
    // TODO(santos): implement whoWeAre
    return null;
  }
}
