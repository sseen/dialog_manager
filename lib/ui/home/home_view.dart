import 'package:dialog_manager/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Center(
            child: ElevatedButton(
              child: Text('Show Dialog'),
              onPressed: () {
                model.doThings();
                Future.delayed(const Duration(seconds: 1), () => model.doThings2());
              },
            ),
          ),
        ),
      ),
    );
  }
}
