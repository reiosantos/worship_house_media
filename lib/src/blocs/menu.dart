import 'package:rxdart/rxdart.dart';
import 'package:whm/src/models/menu.dart';
import 'package:whm/src/resources/repository.dart';

class MenuBlock {
  final Repository _repository = Repository();
  final PublishSubject<Menu> _menuFetcher = PublishSubject<Menu>();

  Observable<Menu> get menuStream => _menuFetcher.stream;

  dynamic fetchMenuList() async {
    final Menu menuModel = await _repository.fetchMenuItems();

    return _menuFetcher.sink.add(menuModel);
  }

  void dispose() {
    _menuFetcher.close();
  }
}

final MenuBlock menuBloc = MenuBlock();
