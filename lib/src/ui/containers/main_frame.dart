import 'package:flutter/material.dart';
import 'package:whm/src/ui/components/drawer.dart';
import 'package:whm/src/ui/containers/scroll_view.dart';

class WhmMainFrame extends StatelessWidget {
  const WhmMainFrame({
    @required this.title,
    @required this.imageUrl,
    @required this.body,
  });

  final String title;
  final String imageUrl;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: false,
      drawer: WhmDrawer(),
      body: WhmScrollView(title: title, imageUrl: imageUrl, body: body),
    );
  }
}
