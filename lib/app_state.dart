import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _selectedCustomer =
        prefs.getString('ff_selectedCustomer')?.ref ?? _selectedCustomer;
    _selectedCustomerName =
        prefs.getString('ff_selectedCustomerName') ?? _selectedCustomerName;
    _selectedCustomerAddress = prefs.getString('ff_selectedCustomerAddress') ??
        _selectedCustomerAddress;
    _selectedRanger =
        prefs.getString('ff_selectedRanger')?.ref ?? _selectedRanger;
    _selectedRangerName =
        prefs.getString('ff_selectedRangerName') ?? _selectedRangerName;
  }

  SharedPreferences prefs;

  DateTime filterDate;

  DocumentReference _selectedCustomer;
  DocumentReference get selectedCustomer => _selectedCustomer;
  set selectedCustomer(DocumentReference _value) {
    _selectedCustomer = _value;
    prefs.setString('ff_selectedCustomer', _value.path);
  }

  String _selectedCustomerName = '';
  String get selectedCustomerName => _selectedCustomerName;
  set selectedCustomerName(String _value) {
    _selectedCustomerName = _value;
    prefs.setString('ff_selectedCustomerName', _value);
  }

  String _selectedCustomerAddress = '';
  String get selectedCustomerAddress => _selectedCustomerAddress;
  set selectedCustomerAddress(String _value) {
    _selectedCustomerAddress = _value;
    prefs.setString('ff_selectedCustomerAddress', _value);
  }

  DocumentReference _selectedRanger;
  DocumentReference get selectedRanger => _selectedRanger;
  set selectedRanger(DocumentReference _value) {
    _selectedRanger = _value;
    prefs.setString('ff_selectedRanger', _value.path);
  }

  String _selectedRangerName = '';
  String get selectedRangerName => _selectedRangerName;
  set selectedRangerName(String _value) {
    _selectedRangerName = _value;
    prefs.setString('ff_selectedRangerName', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
