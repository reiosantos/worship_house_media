import 'package:whm/src/index.dart';

import './bloc.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  @override
  BottomNavigationState get initialState => InitialBottomNavigationState();

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if (event is BottomNavigationEventImpl) {
      yield InitialBottomNavigationState(selectedTab: event.selectedTab);
    }
  }
}
