import 'package:dnd/blocs/spells/spell_events.dart';
import 'package:dnd/blocs/spells/spell_list_bloc.dart';
import 'package:dnd/blocs/spells/spell_states.dart';
import 'package:dnd/models/SpellList.dart';
import 'package:dnd/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpellListScreenPage extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget build(BuildContext context) {
    final SpellListBloc bloc = BlocProvider.of<SpellListBloc>(context);
    bloc.add(SpellListEvent.FetchSpellList);

    return Scaffold(
      appBar: AppBar(title: Text("Spells")),
      body: _spells(bloc),
    );
  }

  Widget _spells(SpellListBloc bloc) =>
      BlocBuilder<SpellListBloc, SpellListState>(
        builder: (BuildContext context, SpellListState state) {
          if (state is SpellListLoadingState) {
            return LoadingWidget();
          } else if (state is SpellListSuccessState) {
            return _showData(context, state.list);
          } else if (state is SpellListEmptyState) {
            return _showEmpty(context, state.list);
          } else {
            return _showError();
          }
        },
      );

  Widget _showData(BuildContext context, SpellList list) => Container(
        child: _buildSpells(context, list),
      );

  Widget _showEmpty(BuildContext context, SpellList list) => Container();

  Widget _showError() => Container();

  Widget _buildSpells(BuildContext context, SpellList list) {
    List<Spell> _results = list.results;
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return _buildRow(_results[i]);
      },
    );
  }

  Widget _buildRow(Spell spell) => ListTile(
        title: Text(
          spell.name,
          style: _biggerFont,
        ),
      );
}
