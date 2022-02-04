import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'drills_record.g.dart';

abstract class DrillsRecord
    implements Built<DrillsRecord, DrillsRecordBuilder> {
  static Serializer<DrillsRecord> get serializer => _$drillsRecordSerializer;

  @nullable
  String get category;

  @nullable
  String get level;

  @nullable
  String get name;

  @nullable
  String get description;

  @nullable
  String get video;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DrillsRecordBuilder builder) => builder
    ..category = ''
    ..level = ''
    ..name = ''
    ..description = ''
    ..video = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drills');

  static Stream<DrillsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DrillsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DrillsRecord._();
  factory DrillsRecord([void Function(DrillsRecordBuilder) updates]) =
      _$DrillsRecord;

  static DrillsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDrillsRecordData({
  String category,
  String level,
  String name,
  String description,
  String video,
}) =>
    serializers.toFirestore(
        DrillsRecord.serializer,
        DrillsRecord((d) => d
          ..category = category
          ..level = level
          ..name = name
          ..description = description
          ..video = video));
