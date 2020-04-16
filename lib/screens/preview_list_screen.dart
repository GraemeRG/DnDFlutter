import 'package:dnd/blocs/list/list_events.dart';
import 'package:dnd/blocs/list/list_bloc.dart';
import 'package:dnd/blocs/list/list_states.dart';
import 'package:dnd/models/preview_list.dart';
import 'package:dnd/widgets/empty.dart';
import 'package:dnd/widgets/error.dart';
import 'package:dnd/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewListScreenPage extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  String config;

  PreviewListScreenPage(String config) {
    this.config = config;
  }

  PreviewListEvent _mapConfigToEvent() {
    if(config == 'Spells') {
      return PreviewListEvent.FetchSpellList;
    } else if(config == 'Classes') {
      return PreviewListEvent.FetchClassList;
    } else if(config == 'Races') {
      return PreviewListEvent.FetchRaceList;
    } else {
      return PreviewListEvent.FetchSpellList;
    }
  }

  Widget build(BuildContext context) {
    final SpellListBloc bloc = BlocProvider.of<SpellListBloc>(context);
    bloc.add(_mapConfigToEvent());

    return Scaffold(
      body: _spells(bloc),
    );
  }

  Widget _spells(SpellListBloc bloc) =>
      BlocBuilder<SpellListBloc, PreviewListState>(
        builder: (BuildContext context, PreviewListState state) {
          if (state is ListLoadingState) {
            return LoadingWidget();
          } else if (state is ListSuccessState) {
            return _showData(context, state.list);
          } else if (state is ListEmptyState) {
            return _showEmpty(context, state.list);
          } else {
            return GenericErrorWidget();
          }
        },
      );

  Widget _showData(BuildContext context, PreviewList list) => Container(
        child: _buildSpells(context, list),
      );

  Widget _showEmpty(BuildContext context, PreviewList list) => GenericEmptyStateWidget();

  Widget _buildSpells(BuildContext context, PreviewList list) {
    List<Preview> _results = list.results;
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return _buildRow(_results[i]);
      },
    );
  }

  Widget _buildRow(Preview spell) => ListTile(
        title: Text(
          spell.name,
          style: _biggerFont,
        ),
      );
}
