import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionListRecord extends FirestoreRecord {
  TransactionListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "date_in" field.
  DateTime? _dateIn;
  DateTime? get dateIn => _dateIn;
  bool hasDateIn() => _dateIn != null;

  // "date_out" field.
  DateTime? _dateOut;
  DateTime? get dateOut => _dateOut;
  bool hasDateOut() => _dateOut != null;

  // "card_no" field.
  String? _cardNo;
  String get cardNo => _cardNo ?? '';
  bool hasCardNo() => _cardNo != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "visitor_ref" field.
  DocumentReference? _visitorRef;
  DocumentReference? get visitorRef => _visitorRef;
  bool hasVisitorRef() => _visitorRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = castToType<int>(snapshotData['status']);
    _dateIn = snapshotData['date_in'] as DateTime?;
    _dateOut = snapshotData['date_out'] as DateTime?;
    _cardNo = snapshotData['card_no'] as String?;
    _fullName = snapshotData['full_name'] as String?;
    _company = snapshotData['company'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _visitorRef = snapshotData['visitor_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('transaction_list')
          : FirebaseFirestore.instance.collectionGroup('transaction_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('transaction_list').doc(id);

  static Stream<TransactionListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionListRecord.fromSnapshot(s));

  static Future<TransactionListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionListRecord.fromSnapshot(s));

  static TransactionListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionListRecordData({
  int? status,
  DateTime? dateIn,
  DateTime? dateOut,
  String? cardNo,
  String? fullName,
  String? company,
  int? duration,
  DocumentReference? visitorRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'date_in': dateIn,
      'date_out': dateOut,
      'card_no': cardNo,
      'full_name': fullName,
      'company': company,
      'duration': duration,
      'visitor_ref': visitorRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionListRecordDocumentEquality
    implements Equality<TransactionListRecord> {
  const TransactionListRecordDocumentEquality();

  @override
  bool equals(TransactionListRecord? e1, TransactionListRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.dateIn == e2?.dateIn &&
        e1?.dateOut == e2?.dateOut &&
        e1?.cardNo == e2?.cardNo &&
        e1?.fullName == e2?.fullName &&
        e1?.company == e2?.company &&
        e1?.duration == e2?.duration &&
        e1?.visitorRef == e2?.visitorRef;
  }

  @override
  int hash(TransactionListRecord? e) => const ListEquality().hash([
        e?.status,
        e?.dateIn,
        e?.dateOut,
        e?.cardNo,
        e?.fullName,
        e?.company,
        e?.duration,
        e?.visitorRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionListRecord;
}
