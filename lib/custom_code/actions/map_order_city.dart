// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

// Begin custom action code
Future mapOrderCity(List<OrdersRecord>? orders) async {
  // Add your function code here!
  List<OrdersRecord> _orderList = orders;
  _orderList.retainWhere((element) => element.customerCity.isEmpty);

  print(_orderList.length);

  for(OrdersRecord order in _orderList){
    var latLng = order.customerLatlng;


    final coordinates = new Coordinates(latLng.latitude, latLng.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var city = addresses.first.subAdminArea;

    if(city != null){
      final ordersUpdateData = createOrdersRecordData(
        customerCity: city,
      );
      await order.reference.update(ordersUpdateData);
    }
  }
}
