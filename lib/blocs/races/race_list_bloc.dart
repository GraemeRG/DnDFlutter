import 'package:dnd/blocs/races/race_events.dart';
import 'package:dnd/blocs/races/race_states.dart';
import 'package:dnd/models/race_list.dart';
import 'package:dnd/repository/race_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RaceListBloc extends Bloc<RaceListEvent, RaceListState> {
  RaceListRepository repository;

  RaceListBloc(this.repository);

  @override
  get initialState => RaceListLoadingState();

  @override
  Stream<RaceListState> mapEventToState(RaceListEvent event) async* {
    if (event == RaceListEvent.FetchRaceList) {
      try {
        final RaceList list = await repository.races();

        yield list.results == null || list.results.isEmpty
            ? RaceListEmptyState(list)
            : RaceListSuccessState(list);
      } catch (exception) {
        yield RaceListErrorState(exception.toString());
      }
    }
  }

}