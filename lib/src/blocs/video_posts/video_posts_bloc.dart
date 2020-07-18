import 'package:whm/src/index.dart';
import 'package:whm/src/services/video_posts_service.dart';

import './video_posts_event.dart';
import './video_posts_state.dart';

class VideoPostsBloc extends Bloc<VideoPostsEvent, VideoPostsState> {
  final VideoPostsService _postsService = VideoPostsService();

  final VideoPostsState initialState;

  VideoPostsBloc({this.initialState})
      : super(initialState ?? VideoPostsEmpty());

  @override
  Stream<VideoPostsState> mapEventToState(
    VideoPostsEvent event,
  ) async* {
    if (event is FetchVideoPosts) {
      yield VideoPostsLoading();
      try {
        final posts = await _postsService.fetchVideoPosts();
        yield VideoPostsLoaded(videos: posts);
      } catch (e) {
        yield VideoPostsError(error: e as String);
      }
    }
  }
}
