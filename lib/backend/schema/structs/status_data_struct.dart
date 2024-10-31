// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusDataStruct extends FFFirebaseStruct {
  StatusDataStruct({
    int? status,
    String? msg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _msg = msg,
        super(firestoreUtilData);

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  set msg(String? val) => _msg = val;

  bool hasMsg() => _msg != null;

  static StatusDataStruct fromMap(Map<String, dynamic> data) =>
      StatusDataStruct(
        status: castToType<int>(data['status']),
        msg: data['msg'] as String?,
      );

  static StatusDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StatusDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'msg': _msg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'msg': serializeParam(
          _msg,
          ParamType.String,
        ),
      }.withoutNulls;

  static StatusDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatusDataStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        msg: deserializeParam(
          data['msg'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StatusDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusDataStruct &&
        status == other.status &&
        msg == other.msg;
  }

  @override
  int get hashCode => const ListEquality().hash([status, msg]);
}

StatusDataStruct createStatusDataStruct({
  int? status,
  String? msg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusDataStruct(
      status: status,
      msg: msg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusDataStruct? updateStatusDataStruct(
  StatusDataStruct? statusData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    statusData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusDataStructData(
  Map<String, dynamic> firestoreData,
  StatusDataStruct? statusData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statusData == null) {
    return;
  }
  if (statusData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && statusData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusDataData = getStatusDataFirestoreData(statusData, forFieldValue);
  final nestedData = statusDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = statusData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusDataFirestoreData(
  StatusDataStruct? statusData, [
  bool forFieldValue = false,
]) {
  if (statusData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(statusData.toMap());

  // Add any Firestore field values
  statusData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusDataListFirestoreData(
  List<StatusDataStruct>? statusDatas,
) =>
    statusDatas?.map((e) => getStatusDataFirestoreData(e, true)).toList() ?? [];
