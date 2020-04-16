import 'package:dnd/blocs/spells/spell_events.dart';
import 'package:dnd/blocs/spells/spell_states.dart';
import 'package:dnd/models/spell_list.dart';
import 'package:dnd/repository/spell_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpellListBloc extends Bloc<SpellListEvent, SpellListState> {
  SpellListRepository repository;

  SpellListBloc(this.repository);

  @override
  get initialState => SpellListLoadingState();

  @override
  Stream<SpellListState> mapEventToState(SpellListEvent event) async* {
    if (event == SpellListEvent.FetchSpellList) {
      try {
        final SpellList list = await repository.spells();

        yield list.results == null || list.results.isEmpty
            ? SpellListEmptyState(list)
            : SpellListSuccessState(list);
      } catch (exception) {
        yield SpellListErrorState(exception.toString());
      }
    }
  }

}