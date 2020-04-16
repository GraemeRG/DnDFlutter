import 'package:dnd/blocs/navigation/navigation_bloc.dart';
import 'package:dnd/blocs/navigation/navigation_events.dart';
import 'package:dnd/blocs/navigation/navigation_states.dart';
import 'package:dnd/screens/spell_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bloc =
        BlocProvider.of<BottomNavigationBloc>(context);
    bloc.add(BottomNavigationEvent.Spells);

    return Scaffold(
      appBar: AppBar(title: Text('D&D Resource')),
      body: _body(bloc),
      bottomNavigationBar: _bottomNav(bloc),
    );
  }

  Widget _body(BottomNavigationBloc bloc) =>
      BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
        if (state is DisplaySpellListState) {
          return SpellListScreenPage();
        } else if (state is DisplayClassListState) {
          return _showBasicData('Classes');
        } else if (state is DisplayRaceListState) {
          return _showBasicData('Races');
        } else {
          return _showBasicData('Spells');
        }
      });

  Widget _bottomNav(BottomNavigationBloc bloc) =>
      BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
        return BottomNavigationBar(
          currentIndex: _getCurrentIndex(state),
          onTap: (index) {
            if (index == 0) bloc.add(BottomNavigationEvent.Spells);
            if (index == 1) bloc.add(BottomNavigationEvent.Classes);
            if (index == 2) bloc.add(BottomNavigationEvent.Races);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add), title: Text('Spells')),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), title: Text('Classes')),
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Races'))
          ],
        );
      });

  Widget _showBasicData(String text) => Container(
        child: Center(
          child: Text(text),
        ),
      );

  int _getCurrentIndex(BottomNavigationState state) {
    if (state is DisplaySpellListState) {
      return 0;
    } else if (state is DisplayClassListState) {
      return 1;
    } else if (state is DisplayRaceListState) {
      return 2;
    } else {
      return 0;
    }
  }
}
