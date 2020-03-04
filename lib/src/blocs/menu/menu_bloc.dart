
import 'package:whm/src/index.dart';
import 'package:whm/src/utilities/constants.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  @override
  MenuState get initialState => InitialMenuState();

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    // TODO: Add your event logic
  }
}
