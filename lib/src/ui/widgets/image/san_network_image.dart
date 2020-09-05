import 'package:flutter/cupertino.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/ui/widgets/progress/san_circular_progress.dart';
import 'package:whm/src/ui/widgets/text/accented_text.dart';

class SanNetworkImage extends StatelessWidget {
  final String url;
  final Widget overlay;

  SanNetworkImage(this.url, {this.overlay});

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Center(
          child: Padding(
              padding: EdgeInsets.only(
                top: 12.0,
                bottom: 12.0,
              ),
              child: AccentedText('Could not load Image')));
    }
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: <Widget>[
          Image.network(
            url,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;

              var value = loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null;

              return SanCircularProgress(value: value);
            },
          ),
          (() {
            if (overlay != null) return overlay;
            return Positioned(
                top: 0, bottom: 0, right: 0, left: 0, child: Container());
          })()
        ],
      ),
    );
  }
}
