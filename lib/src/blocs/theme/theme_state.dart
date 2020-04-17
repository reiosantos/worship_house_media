import 'package:whm/src/index.dart';
import 'package:whm/src/theme/theme.dart';

@immutable
abstract class ThemeState {}

class ChangeThemeState extends ThemeState {
  final Diagnosticable themeData;
  ChangeThemeState({@required this.themeData});

  factory ChangeThemeState.lightTheme() {
    return ChangeThemeState(themeData: AppTheme().lightTheme());
  }

  factory ChangeThemeState.darkTheme() {
    return ChangeThemeState(themeData: AppTheme().darkTheme());
  }
}
