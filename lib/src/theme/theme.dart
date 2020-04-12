import 'package:whm/src/index.dart';
import 'package:whm/src/theme/colors.dart';

class AppTheme extends SanColors {
  @override
  Diagnosticable createTheme() {
    var theme = ThemeData();

    final base = ThemeData(
      primarySwatch: SanColors.primaryColor,
      accentColor: SanColors.accent,
      scaffoldBackgroundColor: SanColors.lightBackground,
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 0,
      ),
      textTheme: theme.textTheme.copyWith(
        title: theme.textTheme.title.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final iosBase = CupertinoThemeData(
      primaryColor: SanColors.primaryColor,
    );

    if (Platform.isIOS) {
      return iosBase;
    }
    return base.copyWith(
      appBarTheme: base.appBarTheme.copyWith(
        textTheme: base.textTheme,
      ),
      accentIconTheme: base.accentIconTheme.copyWith(
        color: SanColors.accentColor.shade900,
      ),
    );
  }

  Diagnosticable lightTheme() {
    if (Platform.isIOS) {
      var base1 = (createTheme() as CupertinoThemeData);
      return base1.copyWith(
        barBackgroundColor: SanColors.lightBackground,
        scaffoldBackgroundColor: SanColors.lightBackground,
        brightness: Brightness.light,
        textTheme: base1.textTheme.copyWith(
          primaryColor: SanColors.lightText,
          textStyle: TextStyle(
            color: SanColors.lightText,
          ),
        ),
      );
    }

    var base = (createTheme() as ThemeData);
    return base.copyWith(
      brightness: Brightness.light,
      backgroundColor: SanColors.lightBackground,
      scaffoldBackgroundColor: SanColors.lightBackground,
      appBarTheme: base.appBarTheme.copyWith(
        color: SanColors.lightBackground,
        textTheme: base.appBarTheme.textTheme.copyWith(
          title: base.appBarTheme.textTheme.title.copyWith(
            color: SanColors.lightText,
          ),
          body1: base.appBarTheme.textTheme.body1.copyWith(
            color: SanColors.lightText,
          ),
        ),
        actionsIconTheme: base.accentIconTheme.copyWith(
          color: SanColors.lightText,
        ),
        iconTheme: base.iconTheme.copyWith(
          color: SanColors.lightText,
        ),
      ),
      textTheme: base.textTheme.copyWith(
        title: base.textTheme.title.copyWith(
          color: SanColors.lightText,
        ),
        body1: base.textTheme.body1.copyWith(
          color: SanColors.lightText,
        ),
      ),
    );
  }

  Diagnosticable darkTheme() {
    if (Platform.isIOS) {
      var base1 = (createTheme() as CupertinoThemeData);
      return base1.copyWith(
        barBackgroundColor: SanColors.darkBackground,
        scaffoldBackgroundColor: SanColors.darkBackground,
        brightness: Brightness.dark,
        textTheme: base1.textTheme.copyWith(
          primaryColor: SanColors.darkText,
          textStyle: TextStyle(
            color: SanColors.darkText,
          ),
        ),
      );
    }

    var base = (createTheme() as ThemeData);
    return base.copyWith(
      brightness: Brightness.dark,
      backgroundColor: SanColors.darkBackground,
      scaffoldBackgroundColor: SanColors.darkBackground,
      appBarTheme: base.appBarTheme.copyWith(
        color: SanColors.darkBackground,
        textTheme: base.appBarTheme.textTheme.copyWith(
          title: base.appBarTheme.textTheme.title.copyWith(
            color: SanColors.darkText,
          ),
          body1: base.appBarTheme.textTheme.body1.copyWith(
            color: SanColors.darkText,
          ),
        ),
        actionsIconTheme: base.accentIconTheme.copyWith(
          color: SanColors.darkText,
        ),
        iconTheme: base.iconTheme.copyWith(
          color: SanColors.darkText,
        ),
      ),
      textTheme: base.textTheme.copyWith(
        title: base.textTheme.title.copyWith(
          color: SanColors.darkText,
        ),
        body1: base.textTheme.body1.copyWith(
          color: SanColors.darkText,
        ),
      ),
    );
  }
}
