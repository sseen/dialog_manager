import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/managers/dialog_manager.dart';
import 'package:dialog_manager/ui/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: widget,
          ),
        ),
      ),
      title: 'Dialog Manager Setup',
      home: HomeView(),
    );
  }
}
