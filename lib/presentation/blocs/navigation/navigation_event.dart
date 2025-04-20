abstract class NavigationEvent {}

class TabChanged extends NavigationEvent {
  final int newIndex;

  TabChanged(this.newIndex);
}
