import 'package:dialog_manager/datamodels/alert_request.dart';
import 'package:dialog_manager/datamodels/alert_response.dart';
import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();

  void buildListener() {
    _DialogManagerState._state.buildListener();
  }
}

class _DialogManagerState extends State<DialogManager> {
  static _DialogManagerState _state;
  _DialogManagerState () {
    _state = this;
  }

  Map<Key,DialogService> _dialogServices = locator<Map<Key,DialogService>>();
  DialogService _dialogService;
  AlertRequest _now ;
  List<AlertRequest> _queue = [];

  @override
  void initState() {
    super.initState();
  }

  void buildListener() {
    for(DialogService one in _dialogServices.values) {
      one.registerDialogListener(_showDialog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    if (_now != null && _now != request) {
      _queue.add(request);
      return;
    } else {
      _now = request;
    }

    Alert(
        context: context,
        title: request.title,
        desc: request.description,
        closeFunction: () =>
            _dialogService.dialogComplete(AlertResponse(confirmed: false)),
        buttons: [
          DialogButton(
            child: Text(request.buttonTitle),
            onPressed: () {
              _dialogService = _dialogServices[_now.serviceKey];

              _dialogService.dialogComplete(AlertResponse(confirmed: true));
              Navigator.of(context).pop();
              _dialogServices.remove(_now.serviceKey);

              for(Key key in _dialogServices.keys) {
                DialogService service = _dialogServices[key];
                _now = service.currentReq;
                Future.delayed(Duration(microseconds: (0.5 * 1000).toInt()),
                        () async {
                      var dialogResult = await service.showDialog(service.currentReq);
                      if (dialogResult.confirmed) {
                        print('User has confirmed2');
                      } else {
                        print('User cancelled the dialog');
                      }
                    });
              }
              if (_dialogServices.length == 0) {
                _now = null;
              }
            },
          )
        ]).show();
  }
}
