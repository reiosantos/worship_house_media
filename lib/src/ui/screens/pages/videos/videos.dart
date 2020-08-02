import 'package:whm/src/blocs/video_posts/bloc.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/models/VideoPost.dart';
import 'package:whm/src/providers/navigator_provider.dart';
import 'package:whm/src/ui/widgets/containers/san_error.dart';
import 'package:whm/src/ui/widgets/containers/san_loading_container.dart';
import 'package:whm/src/utilities/constants.dart';
import 'package:whm/src/utilities/thumbnail.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPostsBloc _videoPostsBloc = VideoPostsBloc();

  void _refreshOnError() {
    _videoPostsBloc.add(FetchVideoPosts());
  }

  Future<void> _refreshPage() async {
    _videoPostsBloc.add(FetchVideoPosts());
  }

  VoidCallback _openVideoDetails(VideoPost videoPost) => () {
        navigationProvider.navigateToNamed(
          Routes.VIDEO_DETAILS_ROUTE[0],
          args: ScreenArguments(
            Routes.VIDEO_DETAILS_ROUTE[1],
            extraArgs: <String, dynamic>{'videoPost': videoPost},
          ),
        );
      };

  @override
  Widget build(BuildContext context) {
    var subtitleTextStyle = Theme.of(context).textTheme.bodyText2;
    Color backgroundColor;
    var subtitleFont = 13.0;

    if (Platform.isIOS) {
      subtitleTextStyle = CupertinoTheme.of(context).textTheme.textStyle;
      backgroundColor = CupertinoTheme.of(context).barBackgroundColor;
    }

    subtitleTextStyle = subtitleTextStyle.copyWith(
      fontSize: subtitleFont,
      backgroundColor: backgroundColor,
    );

    return BlocBuilder<VideoPostsBloc, VideoPostsState>(
      bloc: _videoPostsBloc,
      builder: (context1, VideoPostsState state) {
        if (state is VideoPostsEmpty) {
          _refreshPage();
        }

        if (state is VideoPostsError) {
          return SanErrorContainer(
            state.error,
            refreshHandler: _refreshOnError,
          );
        }

        if (state is VideoPostsLoaded) {
          return RefreshIndicator(
            onRefresh: _refreshPage,
            child: ListView.builder(
              itemCount: state.videos.length,
              itemBuilder: (BuildContext context2, int index) {
                var videoPost = state.videos[index];

                return GestureDetector(
                  onTap: _openVideoDetails(videoPost),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GenThumbnailImage(
                          thumbnailRequest:
                              ThumbnailRequest(video: videoPost.url),
                        ),
                        ListTileTheme(
                          style: ListTileStyle.list,
                          textColor: subtitleTextStyle.color,
                          iconColor: subtitleTextStyle.color,
                          child: Container(
                            color: subtitleTextStyle.backgroundColor,
                            child: ListTile(
                              title: Text(videoPost.title),
                              subtitle: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(videoPost.author),
                                        Spacer(),
                                        Text('•'),
                                        Spacer(),
                                        Text(
                                          '${videoPost.views} views',
                                          style: subtitleTextStyle,
                                        ),
                                        Spacer(),
                                        Text('•'),
                                        Spacer(),
                                        Text(
                                          videoPost.days_past,
                                          style: subtitleTextStyle,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        return SanLoadingContainer();
      },
    );
  }
}
