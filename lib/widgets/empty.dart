import 'package:flutter/cupertino.dart';

class GenericEmptyStateWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child: Text('No Content')),
        Center(child: Text('There doesn\'t appear to be anything here')),
      ]
    );
  }
}