import 'package:dialog_manager/datamodels/alert_request.dart';
import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/foundation.dart';

import '../managers/dialog_manager.dart';

class HomeViewModel extends ChangeNotifier {
  Map<Key,DialogService> _dialogService = locator<Map<Key,DialogService>>();
  DialogManager _manager = locator<DialogManager>();

  Future doThings() async {
    var one = DialogService(UniqueKey());
    _dialogService[one.diaKey] = one;
    _manager.buildListener();

    print('dialog called');
    var req = AlertRequest(serviceKey: one.diaKey,
        title: 'Custom Title',
        description: 'FilledStacks architecture rocks',
        buttonTitle: 'Ok');
    var dialogResult = await one.showDialog(req);
    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }

  Future doThings2() async {
    var one = DialogService(UniqueKey());
    _dialogService[one.diaKey] = one;
    _manager.buildListener();

    print('dialog called2');
    var req = AlertRequest(serviceKey: one.diaKey,
        title: 'Custom Title2',
        description: 'FilledStacks architecture rocks',
        buttonTitle: 'Ok');
    var dialogResult = await one.showDialog(req);
    if (dialogResult.confirmed) {
      print('User has confirmed2');
    } else {
      print('User cancelled the dialog');
    }
  }
}
