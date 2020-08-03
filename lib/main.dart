import 'package:whm/src/app.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/providers/service_locator.dart';

void main() {
  // we are running async on the main thread, in this case we need to use the compute
  // method(running them in isolate) and this requires the bindings to be initialized
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(App());
}
