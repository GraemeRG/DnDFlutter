import 'package:dnd/api/web_service.dart';
import 'package:dnd/repository/spell_list_repository.dart';
import 'package:dnd/screens/spell_list_screen.dart';
import 'package:dnd/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/spells/spell_list_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'D&D Resource',
        home: BlocProvider(
          create: (context) =>
              SpellListBloc(
                  new DefaultSpellListRepository(new DefaultWebService())
              ),
          child: SpellListScreenPage(),
        )
    );
  }

  BlocProvider _getProvider() {
    return BlocProvider(
      create: (context) =>
          SpellListBloc(
              new DefaultSpellListRepository(new DefaultWebService())),
      child: MaterialApp(
        title: 'D&D Resource',
        theme: ThemeData(
            primaryColor: khroneRed
        ),
        home: SpellListScreenPage(),
      ),
    );
  }

  /*
  BlocProvider _getProvider() {
    return BlocProvider(
      create: (context) =>
          SpellListBloc(
              new DefaultSpellListRepository(new DefaultWebService())),
      child: MaterialApp(
        title: 'D&D Resource',
        theme: ThemeData(
            primaryColor: khroneRed
        ),
        home: SpellListScreenPage(),
      ),
    );
  }
   */
}
