import 'package:whm/src/index.dart';
import 'package:whm/src/ui/widgets/video_view/video_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<String> videoUrls = <String>[
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'http://mirrors.standaloneinstaller.com/video-sample/dolbycanyon.3gp',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 12.0,
        color: Colors.blueGrey,
      ),
      itemCount: videoUrls.length,
      itemBuilder: (BuildContext context, int index) {
        // TODO(reiosantos): Add description and title widget
        return VideoView(videoUrls[index]);
      },
    );
  }
}
