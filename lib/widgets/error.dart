import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenericErrorWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) => Container(
      child: Center(
        child: Text(
          'Oops!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black
          ),
        ),
      ),
    );
}