import 'package:whm/src/index.dart';
import 'package:whm/src/ui/widgets/buttons/raised.dart';
import 'package:whm/src/ui/widgets/text/accented_text.dart';

class ErrorContainer extends StatelessWidget {
  final String error;
  final Icon icon;
  final VoidCallback refreshHandler;
  ErrorContainer(this.error, {this.icon, this.refreshHandler});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon ??
              Icon(
                Platform.isIOS ? CupertinoIcons.info : Icons.sync_problem,
                size: 72.0,
                color: Colors.grey.shade600,
              ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: AccentedText(error),
          ),
          refreshHandler != null
              ? SanRaisedButton('Push to Refresh.', refreshHandler)
              : Container(),
        ],
      ),
    );
  }
}
