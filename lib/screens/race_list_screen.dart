import 'package:dnd/blocs/races/race_events.dart';
import 'package:dnd/blocs/races/race_list_bloc.dart';
import 'package:dnd/blocs/races/race_states.dart';
import 'package:dnd/models/race_list.dart';
import 'package:dnd/widgets/empty.dart';
import 'package:dnd/widgets/error.dart';
import 'package:dnd/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RaceListScreenPage extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget build(BuildContext context) {
    final RaceListBloc bloc = BlocProvider.of<RaceListBloc>(context);
    bloc.add(RaceListEvent.FetchRaceList);

    return Scaffold(
      body: _spells(bloc),
    );
  }

  Widget _spells(RaceListBloc bloc) =>
      BlocBuilder<RaceListBloc, RaceListState>(
        builder: (BuildContext context, RaceListState state) {
          if (state is RaceListLoadingState) {
            return LoadingWidget();
          } else if (state is RaceListSuccessState) {
            return _showData(context, state.list);
          } else if (state is RaceListEmptyState) {
            return _showEmpty(context, state.list);
          } else {
            return GenericErrorWidget();
          }
        },
      );

  Widget _showData(BuildContext context, RaceList list) => Container(
    child: _buildRaces(context, list),
  );

  Widget _showEmpty(BuildContext context, RaceList list) => GenericEmptyStateWidget();

  Widget _buildRaces(BuildContext context, RaceList list) {
    List<Race> _results = list.results;
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return _buildRow(_results[i]);
      },
    );
  }

  Widget _buildRow(Race race) => ListTile(
    title: Text(
      race.name,
      style: _biggerFont,
    ),
  );
}
