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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_customerData')) {
        try {
          final serializedData = prefs.getString('ff_customerData') ?? '{}';
          _customerData = CustomerDataStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  CustomerDataStruct _customerData = CustomerDataStruct();
  CustomerDataStruct get customerData => _customerData;
  set customerData(CustomerDataStruct value) {
    _customerData = value;
    prefs.setString('ff_customerData', value.serialize());
  }

  void updateCustomerDataStruct(Function(CustomerDataStruct) updateFn) {
    updateFn(_customerData);
    prefs.setString('ff_customerData', _customerData.serialize());
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
