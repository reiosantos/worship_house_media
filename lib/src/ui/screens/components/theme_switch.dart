import 'package:whm/src/blocs/theme/bloc.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/providers/navigator_provider.dart';
import 'package:whm/src/theme/colors.dart';
import 'package:whm/src/utilities/constants.dart';

// ignore: must_be_immutable
class ThemeSwitch extends StatelessWidget {
  ThemeBloc _themeBloc;
  Brightness _platformBrightness;
  ThemeSwitchMode _selectedTheme;

  Color backgroundColor;
  TextStyle textStyle;
  TextStyle subtitleTextStyle;
  double subtitleFont = 13.0;

  List<Map<String, dynamic>> items = [
    <String, dynamic>{
      'text': 'Light',
      'icon': Platform.isIOS ? CupertinoIcons.brightness : Icons.brightness_5,
      'value': ThemeSwitchMode.LIGHT
    },
    <String, dynamic>{
      'text': 'Dark',
      'icon':
          Platform.isIOS ? CupertinoIcons.brightness_solid : Icons.brightness_2,
      'value': ThemeSwitchMode.DARK
    },
    <String, dynamic>{
      'text': 'System',
      'icon': Platform.isIOS ? CupertinoIcons.gear : Icons.settings,
      'value': ThemeSwitchMode.SYSTEM
    },
  ];

  void _onSelectTheme(ThemeSwitchMode mode) {
    switch (mode) {
      case ThemeSwitchMode.DARK:
        _themeBloc.add(DarkTheme());
        break;
      case ThemeSwitchMode.LIGHT:
        _themeBloc.add(LightTheme());
        break;
      case ThemeSwitchMode.SYSTEM:
        _themeBloc.add(SystemTheme(_platformBrightness));
        break;
      default:
        _themeBloc.add(LightTheme());
        break;
    }
    navigationProvider.pop();
  }

  void _setSelectedTheme(ChangeThemeState state) {
    var evt = state.themeEvent;
    if (evt is LightTheme) {
      _selectedTheme = ThemeSwitchMode.LIGHT;
    }
    if (evt is DarkTheme) {
      _selectedTheme = ThemeSwitchMode.DARK;
    }
    if (evt is SystemTheme) {
      _selectedTheme = ThemeSwitchMode.SYSTEM;
    }
  }

  List<Widget> _getThemeWidget(BuildContext context) {
    return items.map((Map<String, dynamic> item) {
      var theme = item;
      final value = theme['value'] as ThemeSwitchMode;

      return ListTileTheme(
        dense: true,
        style: ListTileStyle.list,
        textColor: subtitleTextStyle.color,
        iconColor: subtitleTextStyle.color,
        selectedColor: SanColors.accentColor,
        child: ListTile(
          onTap: () => _onSelectTheme(value),
          title: Text(theme['text'] as String, style: textStyle),
          leading: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: textStyle.color.withOpacity(0.5),
            ),
            child: Radio<ThemeSwitchMode>(
              activeColor: SanColors.accentColor,
              value: value,
              groupValue: _selectedTheme,
              onChanged: _onSelectTheme,
            ),
          ),
          trailing: Icon(
            item['icon'] as IconData,
            color: textStyle.color,
            size: textStyle.fontSize,
          ),
        ),
      );
    }).toList();
  }

  void _showThemeDialog(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoModalPopup<dynamic>(
          context: context,
          builder: (BuildContext ctx) {
            return CupertinoActionSheet(
              title: Text('Choose Theme', style: textStyle),
              actions: _getThemeWidget(context),
            );
          });
    } else {
      showModalBottomSheet<dynamic>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext ctx) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Choose Theme',
                      style: textStyle.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  ..._getThemeWidget(context)
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _themeBloc = context.bloc<ThemeBloc>();
    _platformBrightness = MediaQuery.of(context).platformBrightness;
    var state = _themeBloc.state as ChangeThemeState;

    if (Platform.isIOS) {
      backgroundColor = CupertinoTheme.of(context).barBackgroundColor;
      textStyle = CupertinoTheme.of(context).textTheme.textStyle;
      subtitleTextStyle = CupertinoTheme.of(context).textTheme.textStyle;
    } else {
      backgroundColor = Theme.of(context).appBarTheme.color;
      textStyle = Theme.of(context).appBarTheme.textTheme.headline6;
      subtitleTextStyle = Theme.of(context).textTheme.bodyText2;
    }

    subtitleTextStyle = subtitleTextStyle.copyWith(
      fontSize: subtitleFont,
      backgroundColor: backgroundColor,
    );

    _setSelectedTheme(state);

    return IconButton(
      onPressed: () => _showThemeDialog(context),
      icon: Icon(Icons.lightbulb_outline, color: textStyle.color, size: 20),
    );
  }
}
