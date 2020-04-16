import 'package:dnd/blocs/navigation/navigation_bloc.dart';
import 'package:dnd/repository/preview_list_repository.dart';
import 'package:dnd/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/web_service.dart';
import 'blocs/list/list_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'D&D Resource',
        home: _getProvider()
    );
  }

  MultiBlocProvider _getProvider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider(
          create: (context) => SpellListBloc(
              new DefaultPreviewListRepository(
                  new DefaultWebService()
              )
          ),
        ),
      ],
      child: MaterialApp(
          title: 'D&D Resource',
          home: BottomNavigationPage()
      ),
    );
  }
}
