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
  }

  SharedPreferences prefs;

  DateTime filterDate;

  DocumentReference selectedCustomer;

  String selectedCustomerName = '';

  String selectedCustomerAddress = '';

  DocumentReference selectedRanger;

  String selectedRangerName = '';

  String selectedCustomerPhone = '';

  LatLng selectedCustomerLatLng;

  String selectedRangerPhone = '';

  String selectedRangerPicture;

  List<DocumentReference> adminList = [
    FirebaseFirestore.instance.doc('/rangers/pUgDOviQ0jPbDBPgvpsCvUtrTA32')
  ];
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
