import 'package:dnd/blocs/list/list_events.dart';
import 'package:dnd/blocs/list/list_states.dart';
import 'package:dnd/models/preview_list.dart';
import 'package:dnd/repository/preview_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpellListBloc extends Bloc<PreviewListEvent, PreviewListState> {
  PreviewListRepository repository;

  SpellListBloc(this.repository);

  @override
  get initialState => ListLoadingState();

  @override
  Stream<PreviewListState> mapEventToState(PreviewListEvent event) async* {
    if (event == PreviewListEvent.FetchSpellList) {
      try {
        final PreviewList list = await repository.spells();

        yield list.results == null || list.results.isEmpty
            ? ListEmptyState(list)
            : ListSuccessState(list);
      } catch (exception) {
        yield ListErrorState(exception.toString());
      }
    } else if (event == PreviewListEvent.FetchClassList) {
      try {
        final PreviewList list = await repository.classes();

        yield list.results == null || list.results.isEmpty
            ? ListEmptyState(list)
            : ListSuccessState(list);
      } catch (exception) {
        yield ListErrorState(exception.toString());
      }
    } else if (event == PreviewListEvent.FetchRaceList) {
      try {
        final PreviewList list = await repository.races();

        yield list.results == null || list.results.isEmpty
            ? ListEmptyState(list)
            : ListSuccessState(list);
      } catch (exception) {
        yield ListErrorState(exception.toString());
      }
    }
  }

}