import 'package:whm/src/blocs/theme/theme_event.dart';
import 'package:whm/src/index.dart';
import 'package:whm/src/theme/theme.dart';

@immutable
abstract class ThemeState {}

class ChangeThemeState extends ThemeState {
  final Diagnosticable themeData;
  final ThemeEvent themeEvent;
  ChangeThemeState({@required this.themeData, this.themeEvent});

  factory ChangeThemeState.lightTheme({ThemeEvent event}) {
    return ChangeThemeState(
      themeData: AppTheme().lightTheme(),
      themeEvent: event,
    );
  }

  factory ChangeThemeState.darkTheme({ThemeEvent event}) {
    return ChangeThemeState(
      themeData: AppTheme().darkTheme(),
      themeEvent: event,
    );
  }
}
