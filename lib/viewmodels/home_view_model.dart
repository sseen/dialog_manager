import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  DialogService _dialogService = locator<DialogService>();

  Future doThings() async {
    print('dialog called');
    var dialogResult = await _dialogService.showDialog(
      title: 'Custom Title',
      description: 'FilledStacks architecture rocks',
    );
    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }
}
