import 'package:dnd/utils/colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: new Theme(
      data: Theme.of(context).copyWith(accentColor: khroneRed),
      child: new CircularProgressIndicator(),
    ));
  }
}
