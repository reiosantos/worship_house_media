import 'package:meta/meta.dart';
import 'package:whm/src/index.dart';

@immutable
abstract class VideoPostsEvent extends Equatable {
  const VideoPostsEvent();

  @override
  List<Object> get props => [];
}

class FetchVideoPosts extends VideoPostsEvent {
  @override
  String toString() => 'Update Video Post Event';
}
