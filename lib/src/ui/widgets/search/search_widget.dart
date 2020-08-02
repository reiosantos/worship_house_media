import 'package:whm/src/index.dart';

// TODO(santos): implement better widget

class SearchWidget extends AnimatedWidget {
  const SearchWidget({
    Key key,
    @required Animation<double> animation,
    @required this.controller,
    @required this.focusNode,
    this.onCancel,
    this.onClear,
    this.onSubmit,
    this.onUpdate,
    this.textStyle,
  })  : assert(controller != null),
        assert(focusNode != null),
        super(key: key, listenable: animation);

  /// The text editing controller to control the search field
  final TextEditingController controller;

  /// The focus node needed to manually unfocus on clear/cancel
  final FocusNode focusNode;

  /// The function to call when the "Cancel" button is pressed
  final VoidCallback onCancel;

  /// The function to call when the "Clear" button is pressed
  final VoidCallback onClear;

  /// The function to call when the text is updated
  final Function(String) onUpdate;

  /// The function to call when the text field is submitted
  final Function(String) onSubmit;
  final TextStyle textStyle;

  static final _opacityTween = Tween(begin: 1.0, end: 0.0);
  static final _paddingTween = Tween(begin: 0.0, end: 60.0);
  static final _kFontSize = 13.0;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border.all(width: 0.0, color: CupertinoColors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 1.0),
                          child: Icon(
                            Platform.isIOS
                                ? CupertinoIcons.search
                                : Icons.search,
                            color: Colors.grey.shade400,
                            size: _kFontSize + 2.0,
                          ))
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: 'Search',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          controller: controller,
                          style: TextStyle(color: Colors.black, fontSize: 13.0),
                          autocorrect: false,
                          focusNode: focusNode,
                          onChanged: onUpdate,
                          onSubmitted: onSubmit,
                          cursorColor: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoButton(
                      minSize: 10.0,
                      padding: const EdgeInsets.all(1.0),
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.grey.shade400.withOpacity(
                        1.0 - _opacityTween.evaluate(animation),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 12.0,
                        color: CupertinoColors.white,
                      ),
                      onPressed: () {
                        if (animation.isDismissed) {
                          return;
                        } else {
                          onClear();
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: _paddingTween.evaluate(animation),
          child: CupertinoButton(
            padding: EdgeInsets.only(left: 8.0),
            onPressed: onCancel,
            child: Text(
              'Cancel',
              softWrap: false,
              style: TextStyle(
                inherit: false,
                color: textStyle.color,
                fontSize: _kFontSize,
              ),
            ),
          ),
        )
      ],
    );
  }
}
