part of 'menu_bloc.dart';

abstract class MenuState {
  String topImage = WHM_IMG;
  String title = APP_TITLE;
}

class InitialMenuState extends MenuState {}
