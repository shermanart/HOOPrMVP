import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'teams_record.g.dart';

abstract class TeamsRecord implements Built<TeamsRecord, TeamsRecordBuilder> {
  static Serializer<TeamsRecord> get serializer => _$teamsRecordSerializer;

  @nullable
  BuiltList<DocumentReference> get members;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TeamsRecordBuilder builder) =>
      builder..members = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teams');

  static Stream<TeamsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TeamsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TeamsRecord._();
  factory TeamsRecord([void Function(TeamsRecordBuilder) updates]) =
      _$TeamsRecord;

  static TeamsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTeamsRecordData() => serializers.toFirestore(
    TeamsRecord.serializer, TeamsRecord((t) => t..members = null));
