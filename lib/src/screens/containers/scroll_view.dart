import 'package:flutter/material.dart';
import 'package:whm/src/blocs/menu/menu_bloc.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/screens/components/app_bar.dart';

class WhmScrollView extends StatelessWidget {
  const WhmScrollView({@required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final MenuState menuState = BlocProvider.of<MenuBloc>(context).state;

    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: WhmAppBar(
                  expandedHeight: 300, title: menuState.title, imageUrl: menuState.topImage),
              pinned: true,
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context_1, int index) {
                return body;
              }),
            )
          ],
        ),
      ),
    );
  }
}
