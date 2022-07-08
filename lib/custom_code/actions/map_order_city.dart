// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future mapOrderCity(List<OrdersRecord> orders) async {
  // Add your function code here!
  List<OrdersRecord> _orderList = orders;
  _orderList.retainWhere((element) => element.status == "Finish");
  _orderList.retainWhere(
          (element) => element.scheduledAt.month == DateTime.now().month);
}
