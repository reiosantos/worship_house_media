import 'package:whm/src/index.dart';
import 'package:whm/src/theme/whm_colors.dart';

class AppTheme extends WhmColors {
  @override
  ThemeData createWhmTheme() {
    final ThemeData base = ThemeData(
        primarySwatch: WhmColors.primaryColor,
        primaryColor: WhmColors.kWhmPrimary,
        primaryColorDark: WhmColors.kWhmPrimaryDark,
        canvasColor: WhmColors.kWhmPrimary,
        accentColor: WhmColors.kWhmSecondary,
        backgroundColor: WhmColors.kWhmPrimaryDark);

    return base.copyWith(
      buttonTheme: base.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.normal,
      ),
      textTheme: base.textTheme.copyWith(
          body1: base.textTheme.body1.copyWith(color: WhmColors.kWhmTextColor)),
      textSelectionColor: WhmColors.kWhmGray50,
      errorColor: WhmColors.kWhmErrorRed,
    );
  }
}
