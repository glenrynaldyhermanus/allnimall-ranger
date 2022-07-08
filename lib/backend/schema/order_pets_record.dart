import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_pets_record.g.dart';

abstract class OrderPetsRecord
    implements Built<OrderPetsRecord, OrderPetsRecordBuilder> {
  static Serializer<OrderPetsRecord> get serializer =>
      _$orderPetsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'order_uid')
  DocumentReference get orderUid;

  @nullable
  @BuiltValueField(wireName: 'pet_uid')
  DocumentReference get petUid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(OrderPetsRecordBuilder builder) => builder;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('order_pets')
          : FirebaseFirestore.instance.collectionGroup('order_pets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('order_pets').doc();

  static Stream<OrderPetsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OrderPetsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OrderPetsRecord._();
  factory OrderPetsRecord([void Function(OrderPetsRecordBuilder) updates]) =
      _$OrderPetsRecord;

  static OrderPetsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOrderPetsRecordData({
  DocumentReference orderUid,
  DocumentReference petUid,
}) =>
    serializers.toFirestore(
        OrderPetsRecord.serializer,
        OrderPetsRecord((o) => o
          ..orderUid = orderUid
          ..petUid = petUid));
