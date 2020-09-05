import 'package:whm/src/index.dart';
import 'package:whm/src/models/VideoPost.dart';

import './index.dart';

class VideoPostsService extends HttpService {
  Future<List<VideoPost>> fetchVideoPosts() async {
    // TODO(reiosantos): Uncomment this when API is ready

//    final response = await client.get(baseUrl);
//    if (response.statusCode != HttpStatus.ok) {
//      throw ClientException(response.body, response.request.url);
//    }
//
//    final json = response.body as Map<String, List<Map<String, dynamic>>>;
//    final data = json['data'];
//    return data.map((e) => VideoPost.fromJson(e)).toList();

//    await Future<dynamic>.delayed(Duration(seconds: 2));

    final posts = <Map<String, dynamic>>[
      <String, dynamic>{
        'author': 'Reio Santos',
        'post_date': '2017-02-20T12:30+0300',
        'title': "God's General Gathering (G3). My Nigga",
        'views': 1000,
        'thumbnail':
            'https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_color.png',
        'url':
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      },
      <String, dynamic>{
        'author': 'Kityo Jackson',
        'post_date': '2019-02-20T12:30+0300',
        'title': 'Jesus Worship Night reloaded',
        'views': 156,
        'thumbnail':
            'https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_colorBurn.png',
        'url':
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      },
      <String, dynamic>{
        'author': 'Pr. Bugembe',
        'post_date': '2020-02-20T12:30+0300',
        'title': 'Celebrity Sunday 1',
        'views': 321,
        'thumbnail':
            'https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_dstOut.png',
        'url':
            'http://mirrors.standaloneinstaller.com/video-sample/dolbycanyon.3gp',
      },
      <String, dynamic>{
        'author': 'Pr. Bugembe',
        'post_date': '2020-07-16T12:30+0300',
        'title': 'Celebrity Sunday 2',
        'views': 321,
        'thumbnail':
            'https://flutter.github.io/assets-for-api-docs/assets/dart-ui/blend_mode_exclusion.png',
        'url':
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      },
      <String, dynamic>{
        'author': 'Pr. Bugembe',
        'post_date': '2020-07-18T12:30+0300',
        'title': 'Celebrity Sunday 3',
        'views': 321,
        'thumbnail':
            'https://flutter.github.io/assets-for-api-docs/assets/dart-ui/tile_mode_mirror_sweep.png',
        'url':
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      },
      <String, dynamic>{
        'author': 'Pr. Bugembe',
        'post_date': '2020-07-18T15:40+0300',
        'title': 'Celebrity Sunday 4',
        'views': 321,
        'thumbnail': null,
        'url':
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/align_transition.mp4',
      },
    ];

    return posts.map((e) => VideoPost.fromJson(e)).toList();
  }
}
