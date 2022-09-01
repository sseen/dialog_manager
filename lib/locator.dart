import 'package:dialog_manager/managers/dialog_manager.dart';
import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Map<Key,DialogService>());
  locator.registerLazySingleton(() => DialogManager());
  Map<Key,DialogService> _dialogService = locator<Map<Key,DialogService>>();
  _dialogService.clear();
}
