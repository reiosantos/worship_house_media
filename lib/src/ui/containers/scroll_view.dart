import 'package:flutter/material.dart';
import 'package:whm/src/ui/components/app_bar.dart';

class WhmScrollView extends StatelessWidget {
  const WhmScrollView(
      {@required this.title, @required this.imageUrl, @required this.body});

  final String title;
  final String imageUrl;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: WhmAppBar(
                  expandedHeight: 300, title: title, imageUrl: imageUrl),
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
