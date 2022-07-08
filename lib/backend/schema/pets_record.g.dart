// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PetsRecord> _$petsRecordSerializer = new _$PetsRecordSerializer();

class _$PetsRecordSerializer implements StructuredSerializer<PetsRecord> {
  @override
  final Iterable<Type> types = const [PetsRecord, _$PetsRecord];
  @override
  final String wireName = 'PetsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.birthdate;
    if (value != null) {
      result
        ..add('birthdate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.breed;
    if (value != null) {
      result
        ..add('breed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.condition;
    if (value != null) {
      result
        ..add('condition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hasDiarrhea;
    if (value != null) {
      result
        ..add('has_diarrhea')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasEarmites;
    if (value != null) {
      result
        ..add('has_earmites')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasFleas;
    if (value != null) {
      result
        ..add('has_fleas')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasFungus;
    if (value != null) {
      result
        ..add('has_fungus')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasScabies;
    if (value != null) {
      result
        ..add('has_scabies')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasSterilised;
    if (value != null) {
      result
        ..add('has_sterilised')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasVaccinated;
    if (value != null) {
      result
        ..add('has_vaccinated')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.hasWorms;
    if (value != null) {
      result
        ..add('has_worms')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerName;
    if (value != null) {
      result
        ..add('owner_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerUid;
    if (value != null) {
      result
        ..add('owner_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.sex;
    if (value != null) {
      result
        ..add('sex')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weightUnit;
    if (value != null) {
      result
        ..add('weight_unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pictureUrl;
    if (value != null) {
      result
        ..add('picture_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  PetsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'birthdate':
          result.birthdate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'breed':
          result.breed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'condition':
          result.condition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'has_diarrhea':
          result.hasDiarrhea = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'has_earmites':
          result.hasEarmites = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'has_fleas':
          result.hasFleas = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'has_fungus':
          result.hasFungus = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'has_scabies':
          result.hasScabies = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'has_sterilised':
          result.hasSterilised = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'has_vaccinated':
          result.hasVaccinated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'has_worms':
          result.hasWorms = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner_name':
          result.ownerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'owner_uid':
          result.ownerUid = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'sex':
          result.sex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'weight_unit':
          result.weightUnit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'picture_url':
          result.pictureUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$PetsRecord extends PetsRecord {
  @override
  final DateTime birthdate;
  @override
  final String breed;
  @override
  final String condition;
  @override
  final bool hasDiarrhea;
  @override
  final bool hasEarmites;
  @override
  final bool hasFleas;
  @override
  final bool hasFungus;
  @override
  final bool hasScabies;
  @override
  final bool hasSterilised;
  @override
  final bool hasVaccinated;
  @override
  final bool hasWorms;
  @override
  final String name;
  @override
  final String ownerName;
  @override
  final DocumentReference<Object> ownerUid;
  @override
  final String sex;
  @override
  final int weight;
  @override
  final String weightUnit;
  @override
  final String pictureUrl;
  @override
  final DocumentReference<Object> reference;

  factory _$PetsRecord([void Function(PetsRecordBuilder) updates]) =>
      (new PetsRecordBuilder()..update(updates)).build();

  _$PetsRecord._(
      {this.birthdate,
      this.breed,
      this.condition,
      this.hasDiarrhea,
      this.hasEarmites,
      this.hasFleas,
      this.hasFungus,
      this.hasScabies,
      this.hasSterilised,
      this.hasVaccinated,
      this.hasWorms,
      this.name,
      this.ownerName,
      this.ownerUid,
      this.sex,
      this.weight,
      this.weightUnit,
      this.pictureUrl,
      this.reference})
      : super._();

  @override
  PetsRecord rebuild(void Function(PetsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetsRecordBuilder toBuilder() => new PetsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetsRecord &&
        birthdate == other.birthdate &&
        breed == other.breed &&
        condition == other.condition &&
        hasDiarrhea == other.hasDiarrhea &&
        hasEarmites == other.hasEarmites &&
        hasFleas == other.hasFleas &&
        hasFungus == other.hasFungus &&
        hasScabies == other.hasScabies &&
        hasSterilised == other.hasSterilised &&
        hasVaccinated == other.hasVaccinated &&
        hasWorms == other.hasWorms &&
        name == other.name &&
        ownerName == other.ownerName &&
        ownerUid == other.ownerUid &&
        sex == other.sex &&
        weight == other.weight &&
        weightUnit == other.weightUnit &&
        pictureUrl == other.pictureUrl &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                birthdate
                                                                                    .hashCode),
                                                                            breed
                                                                                .hashCode),
                                                                        condition
                                                                            .hashCode),
                                                                    hasDiarrhea
                                                                        .hashCode),
                                                                hasEarmites
                                                                    .hashCode),
                                                            hasFleas.hashCode),
                                                        hasFungus.hashCode),
                                                    hasScabies.hashCode),
                                                hasSterilised.hashCode),
                                            hasVaccinated.hashCode),
                                        hasWorms.hashCode),
                                    name.hashCode),
                                ownerName.hashCode),
                            ownerUid.hashCode),
                        sex.hashCode),
                    weight.hashCode),
                weightUnit.hashCode),
            pictureUrl.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetsRecord')
          ..add('birthdate', birthdate)
          ..add('breed', breed)
          ..add('condition', condition)
          ..add('hasDiarrhea', hasDiarrhea)
          ..add('hasEarmites', hasEarmites)
          ..add('hasFleas', hasFleas)
          ..add('hasFungus', hasFungus)
          ..add('hasScabies', hasScabies)
          ..add('hasSterilised', hasSterilised)
          ..add('hasVaccinated', hasVaccinated)
          ..add('hasWorms', hasWorms)
          ..add('name', name)
          ..add('ownerName', ownerName)
          ..add('ownerUid', ownerUid)
          ..add('sex', sex)
          ..add('weight', weight)
          ..add('weightUnit', weightUnit)
          ..add('pictureUrl', pictureUrl)
          ..add('reference', reference))
        .toString();
  }
}

class PetsRecordBuilder implements Builder<PetsRecord, PetsRecordBuilder> {
  _$PetsRecord _$v;

  DateTime _birthdate;
  DateTime get birthdate => _$this._birthdate;
  set birthdate(DateTime birthdate) => _$this._birthdate = birthdate;

  String _breed;
  String get breed => _$this._breed;
  set breed(String breed) => _$this._breed = breed;

  String _condition;
  String get condition => _$this._condition;
  set condition(String condition) => _$this._condition = condition;

  bool _hasDiarrhea;
  bool get hasDiarrhea => _$this._hasDiarrhea;
  set hasDiarrhea(bool hasDiarrhea) => _$this._hasDiarrhea = hasDiarrhea;

  bool _hasEarmites;
  bool get hasEarmites => _$this._hasEarmites;
  set hasEarmites(bool hasEarmites) => _$this._hasEarmites = hasEarmites;

  bool _hasFleas;
  bool get hasFleas => _$this._hasFleas;
  set hasFleas(bool hasFleas) => _$this._hasFleas = hasFleas;

  bool _hasFungus;
  bool get hasFungus => _$this._hasFungus;
  set hasFungus(bool hasFungus) => _$this._hasFungus = hasFungus;

  bool _hasScabies;
  bool get hasScabies => _$this._hasScabies;
  set hasScabies(bool hasScabies) => _$this._hasScabies = hasScabies;

  bool _hasSterilised;
  bool get hasSterilised => _$this._hasSterilised;
  set hasSterilised(bool hasSterilised) =>
      _$this._hasSterilised = hasSterilised;

  bool _hasVaccinated;
  bool get hasVaccinated => _$this._hasVaccinated;
  set hasVaccinated(bool hasVaccinated) =>
      _$this._hasVaccinated = hasVaccinated;

  bool _hasWorms;
  bool get hasWorms => _$this._hasWorms;
  set hasWorms(bool hasWorms) => _$this._hasWorms = hasWorms;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _ownerName;
  String get ownerName => _$this._ownerName;
  set ownerName(String ownerName) => _$this._ownerName = ownerName;

  DocumentReference<Object> _ownerUid;
  DocumentReference<Object> get ownerUid => _$this._ownerUid;
  set ownerUid(DocumentReference<Object> ownerUid) =>
      _$this._ownerUid = ownerUid;

  String _sex;
  String get sex => _$this._sex;
  set sex(String sex) => _$this._sex = sex;

  int _weight;
  int get weight => _$this._weight;
  set weight(int weight) => _$this._weight = weight;

  String _weightUnit;
  String get weightUnit => _$this._weightUnit;
  set weightUnit(String weightUnit) => _$this._weightUnit = weightUnit;

  String _pictureUrl;
  String get pictureUrl => _$this._pictureUrl;
  set pictureUrl(String pictureUrl) => _$this._pictureUrl = pictureUrl;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PetsRecordBuilder() {
    PetsRecord._initializeBuilder(this);
  }

  PetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _birthdate = $v.birthdate;
      _breed = $v.breed;
      _condition = $v.condition;
      _hasDiarrhea = $v.hasDiarrhea;
      _hasEarmites = $v.hasEarmites;
      _hasFleas = $v.hasFleas;
      _hasFungus = $v.hasFungus;
      _hasScabies = $v.hasScabies;
      _hasSterilised = $v.hasSterilised;
      _hasVaccinated = $v.hasVaccinated;
      _hasWorms = $v.hasWorms;
      _name = $v.name;
      _ownerName = $v.ownerName;
      _ownerUid = $v.ownerUid;
      _sex = $v.sex;
      _weight = $v.weight;
      _weightUnit = $v.weightUnit;
      _pictureUrl = $v.pictureUrl;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PetsRecord;
  }

  @override
  void update(void Function(PetsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetsRecord build() {
    final _$result = _$v ??
        new _$PetsRecord._(
            birthdate: birthdate,
            breed: breed,
            condition: condition,
            hasDiarrhea: hasDiarrhea,
            hasEarmites: hasEarmites,
            hasFleas: hasFleas,
            hasFungus: hasFungus,
            hasScabies: hasScabies,
            hasSterilised: hasSterilised,
            hasVaccinated: hasVaccinated,
            hasWorms: hasWorms,
            name: name,
            ownerName: ownerName,
            ownerUid: ownerUid,
            sex: sex,
            weight: weight,
            weightUnit: weightUnit,
            pictureUrl: pictureUrl,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
