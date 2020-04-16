import 'package:dnd/blocs/navigation/navigation_events.dart';
import 'package:dnd/blocs/navigation/navigation_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {

  @override
  BottomNavigationState get initialState => DisplaySpellListState();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if(event == BottomNavigationEvent.Spells) {
      yield DisplaySpellListState();
    } else if(event == BottomNavigationEvent.Classes) {
      yield DisplayClassListState();
    } else if(event == BottomNavigationEvent.Races) {
      yield DisplayRaceListState();
    } else {
      yield DisplaySpellListState();
    }
  }
}