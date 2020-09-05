import 'package:whm/src/index.dart';

// ignore: must_be_immutable
class SanCircularProgress extends StatelessWidget {
  double value;

  SanCircularProgress({this.value});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? CircularProgressIndicator(
            strokeWidth: 2.0,
            value: value,
          )
        : CircularProgressIndicator(
            strokeWidth: 2.0,
            value: value,
            valueColor: AlwaysStoppedAnimation<Color>(
                CupertinoTheme.of(context).primaryContrastingColor),
          );
  }
}
