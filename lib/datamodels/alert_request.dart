import 'package:flutter/foundation.dart';

class AlertRequest {
  final Key serviceKey;
  final String title;
  final String description;
  final String buttonTitle;

  AlertRequest({
    @required this.serviceKey,
    @required this.title,
    @required this.description,
    @required this.buttonTitle,
  });

}
