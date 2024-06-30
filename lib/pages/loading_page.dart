import 'package:flutter/material.dart';


class LoadingPage extends StatelessWidget {

  static const String routeName = 'loading';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading Page'),
     ),
   );
  }
}