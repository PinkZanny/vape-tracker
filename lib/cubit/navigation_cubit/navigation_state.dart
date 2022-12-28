part of 'navigation_cubit.dart';

abstract class NavigationState extends Equatable {
  final TabBarItemWidget tabBarItem;
  final int index;
  final double width;

  const NavigationState(this.tabBarItem, this.index, this.width);

  @override
  List<Object> get props => [tabBarItem, index, width];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial(super.tabBarItem, super.index, super.width);
}
