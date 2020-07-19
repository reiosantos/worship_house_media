import 'package:whm/src/index.dart';
import 'package:whm/src/models/VideoPost.dart';

class VideoDetailsPage extends StatefulWidget {
  final VideoPost video;
  const VideoDetailsPage(this.video, {Key key}) : super(key: key);

  @override
  _VideoDetailsPageState createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('VideoDetails PAGE'),
        ],
      ),
    );
  }
}
