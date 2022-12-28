import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'tab_bar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationInitial(TabBarItemWidget.home, 0, 50));

  void getNavBarItem(TabBarItemWidget tabBarItemWidget) {
    switch (tabBarItemWidget) {
      case TabBarItemWidget.home:
        emit(const NavigationInitial(TabBarItemWidget.home, 0, 50));
        break;
      case TabBarItemWidget.activity:
        emit(const NavigationInitial(TabBarItemWidget.activity, 1, 50));
        break;
      case TabBarItemWidget.juice:
        emit(const NavigationInitial(TabBarItemWidget.juice, 2, 50));
        break;
      case TabBarItemWidget.settings:
        emit(const NavigationInitial(TabBarItemWidget.settings, 3, 50));
        break;
    }
  }
}
