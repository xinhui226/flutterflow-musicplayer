import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MusicRecord extends FirestoreRecord {
  MusicRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "musicUrls" field.
  String? _musicUrls;
  String get musicUrls => _musicUrls ?? '';
  bool hasMusicUrls() => _musicUrls != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _musicUrls = snapshotData['musicUrls'] as String?;
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('music');

  static Stream<MusicRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MusicRecord.fromSnapshot(s));

  static Future<MusicRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MusicRecord.fromSnapshot(s));

  static MusicRecord fromSnapshot(DocumentSnapshot snapshot) => MusicRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MusicRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MusicRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MusicRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MusicRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMusicRecordData({
  String? name,
  String? musicUrls,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'musicUrls': musicUrls,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class MusicRecordDocumentEquality implements Equality<MusicRecord> {
  const MusicRecordDocumentEquality();

  @override
  bool equals(MusicRecord? e1, MusicRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.musicUrls == e2?.musicUrls &&
        e1?.url == e2?.url;
  }

  @override
  int hash(MusicRecord? e) =>
      const ListEquality().hash([e?.name, e?.musicUrls, e?.url]);

  @override
  bool isValidKey(Object? o) => o is MusicRecord;
}
