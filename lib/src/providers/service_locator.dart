import 'package:get_it/get_it.dart';
import 'package:whm/src/providers/navigator_provider.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => NavigationProvider());
}
