import 'package:flutter/material.dart';
import 'package:whm/src/ui/home_page.dart';
import 'package:whm/src/whm_theme.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.

  final String imageUrl =
      'https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  final String title = 'Worship House Minstries';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: AppTheme().createWhmTheme(),
      home: const HomePage(),
    );
  }
}
