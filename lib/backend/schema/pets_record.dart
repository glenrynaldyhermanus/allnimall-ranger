import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pets_record.g.dart';

abstract class PetsRecord implements Built<PetsRecord, PetsRecordBuilder> {
  static Serializer<PetsRecord> get serializer => _$petsRecordSerializer;

  DateTime? get birthdate;

  String? get breed;

  String? get condition;

  @BuiltValueField(wireName: 'has_diarrhea')
  bool? get hasDiarrhea;

  @BuiltValueField(wireName: 'has_earmites')
  bool? get hasEarmites;

  @BuiltValueField(wireName: 'has_fleas')
  bool? get hasFleas;

  @BuiltValueField(wireName: 'has_fungus')
  bool? get hasFungus;

  @BuiltValueField(wireName: 'has_scabies')
  bool? get hasScabies;

  @BuiltValueField(wireName: 'has_sterilised')
  bool? get hasSterilised;

  @BuiltValueField(wireName: 'has_vaccinated')
  bool? get hasVaccinated;

  @BuiltValueField(wireName: 'has_worms')
  bool? get hasWorms;

  String? get name;

  @BuiltValueField(wireName: 'owner_name')
  String? get ownerName;

  @BuiltValueField(wireName: 'owner_uid')
  DocumentReference? get ownerUid;

  String? get sex;

  int? get weight;

  @BuiltValueField(wireName: 'weight_unit')
  String? get weightUnit;

  @BuiltValueField(wireName: 'picture_url')
  String? get pictureUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PetsRecordBuilder builder) => builder
    ..breed = ''
    ..condition = ''
    ..hasDiarrhea = false
    ..hasEarmites = false
    ..hasFleas = false
    ..hasFungus = false
    ..hasScabies = false
    ..hasSterilised = false
    ..hasVaccinated = false
    ..hasWorms = false
    ..name = ''
    ..ownerName = ''
    ..sex = ''
    ..weight = 0
    ..weightUnit = ''
    ..pictureUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pets');

  static Stream<PetsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PetsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PetsRecord._();
  factory PetsRecord([void Function(PetsRecordBuilder) updates]) = _$PetsRecord;

  static PetsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPetsRecordData({
  DateTime? birthdate,
  String? breed,
  String? condition,
  bool? hasDiarrhea,
  bool? hasEarmites,
  bool? hasFleas,
  bool? hasFungus,
  bool? hasScabies,
  bool? hasSterilised,
  bool? hasVaccinated,
  bool? hasWorms,
  String? name,
  String? ownerName,
  DocumentReference? ownerUid,
  String? sex,
  int? weight,
  String? weightUnit,
  String? pictureUrl,
}) {
  final firestoreData = serializers.toFirestore(
    PetsRecord.serializer,
    PetsRecord(
      (p) => p
        ..birthdate = birthdate
        ..breed = breed
        ..condition = condition
        ..hasDiarrhea = hasDiarrhea
        ..hasEarmites = hasEarmites
        ..hasFleas = hasFleas
        ..hasFungus = hasFungus
        ..hasScabies = hasScabies
        ..hasSterilised = hasSterilised
        ..hasVaccinated = hasVaccinated
        ..hasWorms = hasWorms
        ..name = name
        ..ownerName = ownerName
        ..ownerUid = ownerUid
        ..sex = sex
        ..weight = weight
        ..weightUnit = weightUnit
        ..pictureUrl = pictureUrl,
    ),
  );

  return firestoreData;
}
