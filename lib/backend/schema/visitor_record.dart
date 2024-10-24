import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitorRecord extends FirestoreRecord {
  VisitorRecord._(
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

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  bool hasExpireDate() => _expireDate != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "car_number" field.
  String? _carNumber;
  String get carNumber => _carNumber ?? '';
  bool hasCarNumber() => _carNumber != null;

  // "id_card_number" field.
  String? _idCardNumber;
  String get idCardNumber => _idCardNumber ?? '';
  bool hasIdCardNumber() => _idCardNumber != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "area_list" field.
  List<String>? _areaList;
  List<String> get areaList => _areaList ?? const [];
  bool hasAreaList() => _areaList != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _expireDate = snapshotData['expire_date'] as DateTime?;
    _fullName = snapshotData['full_name'] as String?;
    _gender = snapshotData['gender'] as String?;
    _carNumber = snapshotData['car_number'] as String?;
    _idCardNumber = snapshotData['id_card_number'] as String?;
    _image = snapshotData['image'] as String?;
    _areaList = getDataList(snapshotData['area_list']);
    _company = snapshotData['company'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('visitor')
          : FirebaseFirestore.instance.collectionGroup('visitor');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('visitor').doc(id);

  static Stream<VisitorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitorRecord.fromSnapshot(s));

  static Future<VisitorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitorRecord.fromSnapshot(s));

  static VisitorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitorRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  DateTime? expireDate,
  String? fullName,
  String? gender,
  String? carNumber,
  String? idCardNumber,
  String? image,
  String? company,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'expire_date': expireDate,
      'full_name': fullName,
      'gender': gender,
      'car_number': carNumber,
      'id_card_number': idCardNumber,
      'image': image,
      'company': company,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitorRecordDocumentEquality implements Equality<VisitorRecord> {
  const VisitorRecordDocumentEquality();

  @override
  bool equals(VisitorRecord? e1, VisitorRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.expireDate == e2?.expireDate &&
        e1?.fullName == e2?.fullName &&
        e1?.gender == e2?.gender &&
        e1?.carNumber == e2?.carNumber &&
        e1?.idCardNumber == e2?.idCardNumber &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.areaList, e2?.areaList) &&
        e1?.company == e2?.company;
  }

  @override
  int hash(VisitorRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.expireDate,
        e?.fullName,
        e?.gender,
        e?.carNumber,
        e?.idCardNumber,
        e?.image,
        e?.areaList,
        e?.company
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitorRecord;
}
