import 'package:whm/src/index.dart';
import 'package:whm/src/screens/containers/main_frame.dart';
import 'package:whm/src/utilities/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key key, this.title = '', this.imageUrl = 'assets/images/wh.jpg'})
      : super(key: key);

  final String title;
  final String imageUrl;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WhmMainFrame(
        title: widget.title,
        imageUrl: widget.imageUrl,
        body: Container(
          child: Text(APP_TITLE, style: Theme.of(context).textTheme.display1),
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        ));
  }
}
