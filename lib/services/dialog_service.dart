import 'dart:async';

import 'package:dialog_manager/datamodels/alert_request.dart';
import 'package:dialog_manager/datamodels/alert_response.dart';
import 'package:flutter/material.dart';

class DialogService {
  Key diaKey;
  AlertRequest currentReq;

  DialogService(Key key) {
    diaKey = key;
  }

  Function(AlertRequest) _showDialogListener;
  Completer<AlertResponse> _dialogCompleter;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future<AlertResponse> showDialog(AlertRequest req) {
    currentReq = req;
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(req);
    return _dialogCompleter.future;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(AlertResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
