import 'package:flutter/material.dart';
import 'package:whm/src/screens/components/drawer.dart';
import 'package:whm/src/screens/containers/scroll_view.dart';

class WhmMainFrame extends StatelessWidget {
  const WhmMainFrame({@required this.body,});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: false,
      drawer: WhmDrawer(),
      body: WhmScrollView(body: body),
    );
  }
}
