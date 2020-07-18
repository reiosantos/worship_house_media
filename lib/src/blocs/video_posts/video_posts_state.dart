import 'package:meta/meta.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/models/VideoPost.dart';

@immutable
abstract class VideoPostsState extends Equatable {
  const VideoPostsState();

  @override
  List<Object> get props => [];
}

class VideoPostsEmpty extends VideoPostsState {
  final List<VideoPost> videos = [];
}

class VideoPostsLoading extends VideoPostsState {}

class VideoPostsError extends VideoPostsState {
  final String error;
  final String code;
  VideoPostsError({this.code, @required this.error});
}

class VideoPostsLoaded extends VideoPostsState {
  final List<VideoPost> videos;
  VideoPostsLoaded({@required this.videos}) : assert(videos != null);
}
