// build command: flutter pub run build_runner build

abstract class IMenu {
  List<String> menu;
  Future<List<String>> fetchMenu();

  dynamic whoWeAre();
  dynamic information();
}
