import 'package:whm/src/index.dart';
import 'package:whm/src/providers/repository.dart';

class MenuBlock {
  final Repository _repository = Repository();
  final PublishSubject<List<String>> _menuFetcher =
      PublishSubject<List<String>>();

  Observable<List<String>> get menuStream => _menuFetcher.stream;

  dynamic fetchMenuList() async {
    final List<String> menuModel = await _repository.fetchMenuItems();

    return _menuFetcher.sink.add(menuModel);
  }

  void dispose() {
    _menuFetcher.close();
  }
}

final MenuBlock menuBloc = MenuBlock();
