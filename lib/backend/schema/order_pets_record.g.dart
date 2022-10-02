// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderPetsRecord> _$orderPetsRecordSerializer =
    new _$OrderPetsRecordSerializer();

class _$OrderPetsRecordSerializer
    implements StructuredSerializer<OrderPetsRecord> {
  @override
  final Iterable<Type> types = const [OrderPetsRecord, _$OrderPetsRecord];
  @override
  final String wireName = 'OrderPetsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderPetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orderUid;
    if (value != null) {
      result
        ..add('order_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.petUid;
    if (value != null) {
      result
        ..add('pet_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  OrderPetsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderPetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'order_uid':
          result.orderUid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'pet_uid':
          result.petUid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderPetsRecord extends OrderPetsRecord {
  @override
  final DocumentReference<Object?>? orderUid;
  @override
  final DocumentReference<Object?>? petUid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderPetsRecord([void Function(OrderPetsRecordBuilder)? updates]) =>
      (new OrderPetsRecordBuilder()..update(updates))._build();

  _$OrderPetsRecord._({this.orderUid, this.petUid, this.ffRef}) : super._();

  @override
  OrderPetsRecord rebuild(void Function(OrderPetsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderPetsRecordBuilder toBuilder() =>
      new OrderPetsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderPetsRecord &&
        orderUid == other.orderUid &&
        petUid == other.petUid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, orderUid.hashCode), petUid.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderPetsRecord')
          ..add('orderUid', orderUid)
          ..add('petUid', petUid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderPetsRecordBuilder
    implements Builder<OrderPetsRecord, OrderPetsRecordBuilder> {
  _$OrderPetsRecord? _$v;

  DocumentReference<Object?>? _orderUid;
  DocumentReference<Object?>? get orderUid => _$this._orderUid;
  set orderUid(DocumentReference<Object?>? orderUid) =>
      _$this._orderUid = orderUid;

  DocumentReference<Object?>? _petUid;
  DocumentReference<Object?>? get petUid => _$this._petUid;
  set petUid(DocumentReference<Object?>? petUid) => _$this._petUid = petUid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderPetsRecordBuilder() {
    OrderPetsRecord._initializeBuilder(this);
  }

  OrderPetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderUid = $v.orderUid;
      _petUid = $v.petUid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderPetsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderPetsRecord;
  }

  @override
  void update(void Function(OrderPetsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderPetsRecord build() => _build();

  _$OrderPetsRecord _build() {
    final _$result = _$v ??
        new _$OrderPetsRecord._(
            orderUid: orderUid, petUid: petUid, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
