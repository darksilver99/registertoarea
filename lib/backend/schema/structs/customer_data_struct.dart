// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerDataStruct extends FFFirebaseStruct {
  CustomerDataStruct({
    String? customerName,
    DateTime? expireDate,
    String? customerId,
    DocumentReference? customerRef,
    bool? superAdminMode,
    List<String>? zoneList,
    List<String>? typeList,
    String? logo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _customerName = customerName,
        _expireDate = expireDate,
        _customerId = customerId,
        _customerRef = customerRef,
        _superAdminMode = superAdminMode,
        _zoneList = zoneList,
        _typeList = typeList,
        _logo = logo,
        super(firestoreUtilData);

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  set customerName(String? val) => _customerName = val;

  bool hasCustomerName() => _customerName != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  set expireDate(DateTime? val) => _expireDate = val;

  bool hasExpireDate() => _expireDate != null;

  // "customer_id" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  set customerId(String? val) => _customerId = val;

  bool hasCustomerId() => _customerId != null;

  // "customer_ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  set customerRef(DocumentReference? val) => _customerRef = val;

  bool hasCustomerRef() => _customerRef != null;

  // "super_admin_mode" field.
  bool? _superAdminMode;
  bool get superAdminMode => _superAdminMode ?? false;
  set superAdminMode(bool? val) => _superAdminMode = val;

  bool hasSuperAdminMode() => _superAdminMode != null;

  // "zone_list" field.
  List<String>? _zoneList;
  List<String> get zoneList => _zoneList ?? const [];
  set zoneList(List<String>? val) => _zoneList = val;

  void updateZoneList(Function(List<String>) updateFn) {
    updateFn(_zoneList ??= []);
  }

  bool hasZoneList() => _zoneList != null;

  // "type_list" field.
  List<String>? _typeList;
  List<String> get typeList => _typeList ?? const [];
  set typeList(List<String>? val) => _typeList = val;

  void updateTypeList(Function(List<String>) updateFn) {
    updateFn(_typeList ??= []);
  }

  bool hasTypeList() => _typeList != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  static CustomerDataStruct fromMap(Map<String, dynamic> data) =>
      CustomerDataStruct(
        customerName: data['customer_name'] as String?,
        expireDate: data['expire_date'] as DateTime?,
        customerId: data['customer_id'] as String?,
        customerRef: data['customer_ref'] as DocumentReference?,
        superAdminMode: data['super_admin_mode'] as bool?,
        zoneList: getDataList(data['zone_list']),
        typeList: getDataList(data['type_list']),
        logo: data['logo'] as String?,
      );

  static CustomerDataStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomerDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'customer_name': _customerName,
        'expire_date': _expireDate,
        'customer_id': _customerId,
        'customer_ref': _customerRef,
        'super_admin_mode': _superAdminMode,
        'zone_list': _zoneList,
        'type_list': _typeList,
        'logo': _logo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_name': serializeParam(
          _customerName,
          ParamType.String,
        ),
        'expire_date': serializeParam(
          _expireDate,
          ParamType.DateTime,
        ),
        'customer_id': serializeParam(
          _customerId,
          ParamType.String,
        ),
        'customer_ref': serializeParam(
          _customerRef,
          ParamType.DocumentReference,
        ),
        'super_admin_mode': serializeParam(
          _superAdminMode,
          ParamType.bool,
        ),
        'zone_list': serializeParam(
          _zoneList,
          ParamType.String,
          isList: true,
        ),
        'type_list': serializeParam(
          _typeList,
          ParamType.String,
          isList: true,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomerDataStruct(
        customerName: deserializeParam(
          data['customer_name'],
          ParamType.String,
          false,
        ),
        expireDate: deserializeParam(
          data['expire_date'],
          ParamType.DateTime,
          false,
        ),
        customerId: deserializeParam(
          data['customer_id'],
          ParamType.String,
          false,
        ),
        customerRef: deserializeParam(
          data['customer_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer_list'],
        ),
        superAdminMode: deserializeParam(
          data['super_admin_mode'],
          ParamType.bool,
          false,
        ),
        zoneList: deserializeParam<String>(
          data['zone_list'],
          ParamType.String,
          true,
        ),
        typeList: deserializeParam<String>(
          data['type_list'],
          ParamType.String,
          true,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CustomerDataStruct &&
        customerName == other.customerName &&
        expireDate == other.expireDate &&
        customerId == other.customerId &&
        customerRef == other.customerRef &&
        superAdminMode == other.superAdminMode &&
        listEquality.equals(zoneList, other.zoneList) &&
        listEquality.equals(typeList, other.typeList) &&
        logo == other.logo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        customerName,
        expireDate,
        customerId,
        customerRef,
        superAdminMode,
        zoneList,
        typeList,
        logo
      ]);
}

CustomerDataStruct createCustomerDataStruct({
  String? customerName,
  DateTime? expireDate,
  String? customerId,
  DocumentReference? customerRef,
  bool? superAdminMode,
  String? logo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomerDataStruct(
      customerName: customerName,
      expireDate: expireDate,
      customerId: customerId,
      customerRef: customerRef,
      superAdminMode: superAdminMode,
      logo: logo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomerDataStruct? updateCustomerDataStruct(
  CustomerDataStruct? customerData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customerData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomerDataStructData(
  Map<String, dynamic> firestoreData,
  CustomerDataStruct? customerData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customerData == null) {
    return;
  }
  if (customerData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customerData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customerDataData =
      getCustomerDataFirestoreData(customerData, forFieldValue);
  final nestedData =
      customerDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customerData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomerDataFirestoreData(
  CustomerDataStruct? customerData, [
  bool forFieldValue = false,
]) {
  if (customerData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customerData.toMap());

  // Add any Firestore field values
  customerData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomerDataListFirestoreData(
  List<CustomerDataStruct>? customerDatas,
) =>
    customerDatas?.map((e) => getCustomerDataFirestoreData(e, true)).toList() ??
    [];
