abstract class BottomNavigationState {}

class DisplaySpellListState extends BottomNavigationState {
  final int itemIndex = 0;
}

class DisplayClassListState extends BottomNavigationState {
  final int itemIndex = 1;
}

class DisplayRaceListState extends BottomNavigationState {
  final int itemIndex = 2;
}