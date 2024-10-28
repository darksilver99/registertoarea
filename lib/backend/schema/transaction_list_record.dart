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

  // "date_in" field.
  DateTime? _dateIn;
  DateTime? get dateIn => _dateIn;
  bool hasDateIn() => _dateIn != null;

  // "date_out" field.
  DateTime? _dateOut;
  DateTime? get dateOut => _dateOut;
  bool hasDateOut() => _dateOut != null;

  // "visitor_ref" field.
  DocumentReference? _visitorRef;
  DocumentReference? get visitorRef => _visitorRef;
  bool hasVisitorRef() => _visitorRef != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _status = castToType<int>(snapshotData['status']);
    _dateIn = snapshotData['date_in'] as DateTime?;
    _dateOut = snapshotData['date_out'] as DateTime?;
    _visitorRef = snapshotData['visitor_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction_list');

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
  DateTime? createDate,
  DateTime? updateDate,
  int? status,
  DateTime? dateIn,
  DateTime? dateOut,
  DocumentReference? visitorRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'update_date': updateDate,
      'status': status,
      'date_in': dateIn,
      'date_out': dateOut,
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
    return e1?.createDate == e2?.createDate &&
        e1?.updateDate == e2?.updateDate &&
        e1?.status == e2?.status &&
        e1?.dateIn == e2?.dateIn &&
        e1?.dateOut == e2?.dateOut &&
        e1?.visitorRef == e2?.visitorRef;
  }

  @override
  int hash(TransactionListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.updateDate,
        e?.status,
        e?.dateIn,
        e?.dateOut,
        e?.visitorRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionListRecord;
}
