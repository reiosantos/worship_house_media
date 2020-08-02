import 'package:whm/src/index.dart';
import 'package:whm/src/ui/widgets/progress/san_circular_progress.dart';
import 'package:whm/src/ui/widgets/text/accented_text.dart';

class LoadingSpinner extends StatelessWidget {
  final String message;
  LoadingSpinner({this.message = 'Loading...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: AccentedText(message),
          ),
          SanCircularProgress(),
        ],
      ),
    );
  }
}
