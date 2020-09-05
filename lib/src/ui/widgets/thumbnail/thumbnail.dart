import 'dart:isolate';

import 'package:whm/src/index.dart';
import 'package:whm/src/ui/widgets/error/error.dart';
import 'package:whm/src/ui/widgets/loader/loader.dart';

class ThumbnailRequest {
  final String video;
  final bool saveThumbnail;
  final ImageFormat imageFormat;
  final int maxHeight;
  final int maxWidth;
  final int timeMs;
  final int quality;
  final String ext = 'jpg';

  const ThumbnailRequest({
    this.video,
    this.saveThumbnail = true,
    this.imageFormat = ImageFormat.JPEG,
    this.maxHeight = 0,
    this.maxWidth = 0,
    this.timeMs = 2000, // 2 seconds
    this.quality = 50,
  });
}

class _ThumbnailResult {
  final Image image;
  final int dataSize;
  final int height;
  final int width;

  const _ThumbnailResult({this.image, this.dataSize, this.height, this.width});
}

Future<String> _thumbnailFile(Map<String, dynamic> r) {
  return VideoThumbnail.thumbnailFile(
    video: r['video'] as String,
    thumbnailPath: r['thumbnailPath'] as String,
    imageFormat: r['imageFormat'] as ImageFormat,
    maxHeight: r['maxHeight'] as int,
    maxWidth: r['maxWidth'] as int,
    timeMs: r['timeMs'] as int,
    quality: r['quality'] as int,
  );
}

Future<Uint8List> _thumbnailData(Map<String, dynamic> r) {
  return VideoThumbnail.thumbnailData(
    video: r['video'] as String,
    imageFormat: r['imageFormat'] as ImageFormat,
    maxHeight: r['maxHeight'] as int,
    maxWidth: r['maxWidth'] as int,
    timeMs: r['timeMs'] as int,
    quality: r['quality'] as int,
  );
}

Future<_ThumbnailResult> _genThumbnail(ThumbnailRequest r) async {
  WidgetsFlutterBinding.ensureInitialized();
  Uint8List bytes;
  final completer = Completer<_ThumbnailResult>();

  if (r.saveThumbnail) {
    var dir = await getApplicationDocumentsDirectory();
    var thumbnails_dir = Directory('${dir.path}/thumbnails');

    if (!(await thumbnails_dir.exists())) {
      thumbnails_dir = await thumbnails_dir.create();
    }

    var name = r.video.split('/');
    var fileName = name[name.length - 1].split('.')[0];
    fileName = '$fileName.${r.ext}';

    var thumbnailPath = '${thumbnails_dir.path}/${fileName}';
    final fileExists = await File(thumbnailPath).exists();

    if (fileExists == false) {
      thumbnailPath = await compute(_thumbnailFile, {
        'video': r.video,
        'thumbnailPath': thumbnails_dir.path,
        'imageFormat': r.imageFormat,
        'maxHeight': r.maxHeight,
        'maxWidth': r.maxWidth,
        'timeMs': r.timeMs,
        'quality': r.quality,
      });
    }

    final file = File(thumbnailPath);
    bytes = file.readAsBytesSync();
  } else {
    bytes = await Isolate.spawn(_thumbnailData, {
      'video': r.video,
      'imageFormat': r.imageFormat,
      'maxHeight': r.maxHeight,
      'maxWidth': r.maxWidth,
      'timeMs': r.timeMs,
      'quality': r.quality,
    }) as Uint8List;
  }

  var _imageDataSize = bytes.length;

  final _image = Image.memory(bytes);
  _image.image
      .resolve(ImageConfiguration())
      .addListener(ImageStreamListener((ImageInfo info, bool _) {
    completer.complete(_ThumbnailResult(
      image: _image,
      dataSize: _imageDataSize,
      height: info.image.height,
      width: info.image.width,
    ));
  }));
  return completer.future;
}

class GenThumbnailImage extends StatefulWidget {
  final ThumbnailRequest thumbnailRequest;

  const GenThumbnailImage({Key key, this.thumbnailRequest}) : super(key: key);

  @override
  _GenThumbnailImageState createState() => _GenThumbnailImageState();
}

class _GenThumbnailImageState extends State<GenThumbnailImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_ThumbnailResult>(
      future: _genThumbnail(widget.thumbnailRequest),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final _image = snapshot.data.image as Image;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_image],
            );
          }
          if (snapshot.hasError) {
            var message = snapshot.error.toString();

            if (snapshot.error is PlatformException) {
              message = 'Cant display thumbnail for video.';
            }
            return ErrorContainer(message);
          }
        }
        return LoadingSpinner();
      },
    );
  }
}
