import 'package:whm/src/index.dart';
import 'package:whm/src/utilities/constants.dart';

// ignore: must_be_immutable
class VideoPost extends Equatable {
  final String url;
  final String author;
  final String post_date;
  final String title;
  final num views;
  String days_past = '';

  VideoPost({this.author, this.url, this.post_date, this.title, this.views}) {
    _calculateDaysPast();
  }

  void _calculateDaysPast() {
    var _post_date = DateTime.parse(post_date);
    var today = DateTime.now();
    var difference = today.difference(_post_date).inDays;

    var years = (difference / DAYS_IN_A_YEAR).truncate();
    var days = difference % DAYS_IN_A_YEAR;
    var months = 0;
    var hours = 0;
    var minutes = 0;

    if (days > (DAYS_IN_A_YEAR - 10)) {
      years += 1;
    } else {
      months = (days / DAYS_IN_A_MONTH).truncate();
      days = days % DAYS_IN_A_MONTH;
      if (days > (DAYS_IN_A_MONTH - 10)) {
        months += 1;
        days = 0;
      }
    }

    if (years > 0) days_past += "$years year${years > 1 ? 's' : ''} ";
    if (months > 0) days_past += "$months month${months > 1 ? 's' : ''} ";

    if (years == 0 && months == 0) {
      if (days < 2) {
        minutes = today.difference(_post_date).inMinutes;
        if (minutes > 59) {
          hours = (minutes / 60).ceil();
          days_past = "$hours hour${hours > 1 ? 's' : ''} ";
        } else {
          days_past = "$minutes minute${minutes > 1 ? 's' : ''} ";
        }
      } else {
        days_past = "$days day${days > 1 ? 's' : ''} ";
      }
    }
    days_past += 'ago';
  }

  @override
  List<Object> get props => [url, author, title];

  @override
  String toString() => 'VideoPost: $title - $post_date';

  factory VideoPost.fromJson(Map<String, dynamic> json) {
    return VideoPost(
      url: json['url'] as String,
      author: json['author'] as String,
      post_date: json['post_date'] as String,
      title: json['title'] as String,
    );
  }
}
