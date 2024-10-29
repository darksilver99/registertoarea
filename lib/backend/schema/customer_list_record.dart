import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerListRecord extends FirestoreRecord {
  CustomerListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  // "super_admin_mode" field.
  bool? _superAdminMode;
  bool get superAdminMode => _superAdminMode ?? false;
  bool hasSuperAdminMode() => _superAdminMode != null;

  // "zone_list" field.
  List<String>? _zoneList;
  List<String> get zoneList => _zoneList ?? const [];
  bool hasZoneList() => _zoneList != null;

  // "type_list" field.
  List<String>? _typeList;
  List<String> get typeList => _typeList ?? const [];
  bool hasTypeList() => _typeList != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _customerName = snapshotData['customer_name'] as String?;
    _expireDate = snapshotData['expire_date'] as DateTime?;
    _superAdminMode = snapshotData['super_admin_mode'] as bool?;
    _zoneList = getDataList(snapshotData['zone_list']);
    _typeList = getDataList(snapshotData['type_list']);
    _logo = snapshotData['logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer_list');

  static Stream<CustomerListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerListRecord.fromSnapshot(s));

  static Future<CustomerListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerListRecord.fromSnapshot(s));

  static CustomerListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  int? status,
  String? customerName,
  DateTime? expireDate,
  bool? superAdminMode,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'status': status,
      'customer_name': customerName,
      'expire_date': expireDate,
      'super_admin_mode': superAdminMode,
      'logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerListRecordDocumentEquality
    implements Equality<CustomerListRecord> {
  const CustomerListRecordDocumentEquality();

  @override
  bool equals(CustomerListRecord? e1, CustomerListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.status == e2?.status &&
        e1?.customerName == e2?.customerName &&
        e1?.expireDate == e2?.expireDate &&
        e1?.superAdminMode == e2?.superAdminMode &&
        listEquality.equals(e1?.zoneList, e2?.zoneList) &&
        listEquality.equals(e1?.typeList, e2?.typeList) &&
        e1?.logo == e2?.logo;
  }

  @override
  int hash(CustomerListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.status,
        e?.customerName,
        e?.expireDate,
        e?.superAdminMode,
        e?.zoneList,
        e?.typeList,
        e?.logo
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerListRecord;
}
