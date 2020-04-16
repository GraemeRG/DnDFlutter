import 'package:dnd/blocs/navigation/navigation_bloc.dart';
import 'package:dnd/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'D&D Resource',
        home: BlocProvider(
          create: (context) => BottomNavigationBloc(),
          child: BottomNavigationPage(),
        )
    );
  }
}
