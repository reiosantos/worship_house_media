import 'package:whm/src/index.dart';
import 'package:whm/src/screens/components/search_bar.dart';

class WhmAppBar extends SliverPersistentHeaderDelegate {
  WhmAppBar(
      {@required this.expandedHeight,
      @required this.title,
      @required this.imageUrl});

  final double expandedHeight;
  final String title;
  final String imageUrl;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        height: expandedHeight,
        child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: <Widget>[
              Opacity(
                opacity: 1,
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
              Container(
                child: Opacity(
                  opacity: 1 - shrinkOffset / expandedHeight,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(title,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                      )),
                ),
              ),
              WhmSearchBar(
                  expandedHeight: expandedHeight, shrinkOffset: shrinkOffset)
            ]));
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
