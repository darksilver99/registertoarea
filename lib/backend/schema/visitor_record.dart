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

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

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

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "card_no" field.
  String? _cardNo;
  String get cardNo => _cardNo ?? '';
  bool hasCardNo() => _cardNo != null;

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  bool hasNationality() => _nationality != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "zone" field.
  String? _zone;
  String get zone => _zone ?? '';
  bool hasZone() => _zone != null;

  // "keyword_list" field.
  List<String>? _keywordList;
  List<String> get keywordList => _keywordList ?? const [];
  bool hasKeywordList() => _keywordList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _expireDate = snapshotData['expire_date'] as DateTime?;
    _fullName = snapshotData['full_name'] as String?;
    _gender = snapshotData['gender'] as String?;
    _carNumber = snapshotData['car_number'] as String?;
    _idCardNumber = snapshotData['id_card_number'] as String?;
    _image = snapshotData['image'] as String?;
    _company = snapshotData['company'] as String?;
    _cardNo = snapshotData['card_no'] as String?;
    _nationality = snapshotData['nationality'] as String?;
    _type = snapshotData['type'] as String?;
    _address = snapshotData['address'] as String?;
    _zone = snapshotData['zone'] as String?;
    _keywordList = getDataList(snapshotData['keyword_list']);
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
  DateTime? updateDate,
  int? status,
  DateTime? expireDate,
  String? fullName,
  String? gender,
  String? carNumber,
  String? idCardNumber,
  String? image,
  String? company,
  String? cardNo,
  String? nationality,
  String? type,
  String? address,
  String? zone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'update_date': updateDate,
      'status': status,
      'expire_date': expireDate,
      'full_name': fullName,
      'gender': gender,
      'car_number': carNumber,
      'id_card_number': idCardNumber,
      'image': image,
      'company': company,
      'card_no': cardNo,
      'nationality': nationality,
      'type': type,
      'address': address,
      'zone': zone,
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
        e1?.updateDate == e2?.updateDate &&
        e1?.status == e2?.status &&
        e1?.expireDate == e2?.expireDate &&
        e1?.fullName == e2?.fullName &&
        e1?.gender == e2?.gender &&
        e1?.carNumber == e2?.carNumber &&
        e1?.idCardNumber == e2?.idCardNumber &&
        e1?.image == e2?.image &&
        e1?.company == e2?.company &&
        e1?.cardNo == e2?.cardNo &&
        e1?.nationality == e2?.nationality &&
        e1?.type == e2?.type &&
        e1?.address == e2?.address &&
        e1?.zone == e2?.zone &&
        listEquality.equals(e1?.keywordList, e2?.keywordList);
  }

  @override
  int hash(VisitorRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.updateDate,
        e?.status,
        e?.expireDate,
        e?.fullName,
        e?.gender,
        e?.carNumber,
        e?.idCardNumber,
        e?.image,
        e?.company,
        e?.cardNo,
        e?.nationality,
        e?.type,
        e?.address,
        e?.zone,
        e?.keywordList
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitorRecord;
}
