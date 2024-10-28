import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZoneListRecord extends FirestoreRecord {
  ZoneListRecord._(
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

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _subject = snapshotData['subject'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('zone_list')
          : FirebaseFirestore.instance.collectionGroup('zone_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('zone_list').doc(id);

  static Stream<ZoneListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ZoneListRecord.fromSnapshot(s));

  static Future<ZoneListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ZoneListRecord.fromSnapshot(s));

  static ZoneListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ZoneListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ZoneListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ZoneListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ZoneListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ZoneListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createZoneListRecordData({
  DateTime? createDate,
  DateTime? updateDate,
  String? subject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'update_date': updateDate,
      'subject': subject,
    }.withoutNulls,
  );

  return firestoreData;
}

class ZoneListRecordDocumentEquality implements Equality<ZoneListRecord> {
  const ZoneListRecordDocumentEquality();

  @override
  bool equals(ZoneListRecord? e1, ZoneListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.updateDate == e2?.updateDate &&
        e1?.subject == e2?.subject;
  }

  @override
  int hash(ZoneListRecord? e) =>
      const ListEquality().hash([e?.createDate, e?.updateDate, e?.subject]);

  @override
  bool isValidKey(Object? o) => o is ZoneListRecord;
}
