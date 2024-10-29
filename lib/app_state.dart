import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  CustomerDataStruct _customerData = CustomerDataStruct();
  CustomerDataStruct get customerData => _customerData;
  set customerData(CustomerDataStruct value) {
    _customerData = value;
  }

  void updateCustomerDataStruct(Function(CustomerDataStruct) updateFn) {
    updateFn(_customerData);
  }

  List<String> _tmpZone = [];
  List<String> get tmpZone => _tmpZone;
  set tmpZone(List<String> value) {
    _tmpZone = value;
  }

  void addToTmpZone(String value) {
    tmpZone.add(value);
  }

  void removeFromTmpZone(String value) {
    tmpZone.remove(value);
  }

  void removeAtIndexFromTmpZone(int index) {
    tmpZone.removeAt(index);
  }

  void updateTmpZoneAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    tmpZone[index] = updateFn(_tmpZone[index]);
  }

  void insertAtIndexInTmpZone(int index, String value) {
    tmpZone.insert(index, value);
  }
}
