import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

DateTime dateStart(DateTime timestamp) {
  if(timestamp == null){
    timestamp = DateTime.now();
  }
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 0, 0, 0);
}

DateTime dateEnd(DateTime timestamp) {
  if(timestamp == null){
    timestamp = DateTime.now();
  }
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 23, 59, 59);
}

String countEndTimeForOrder(
  int startHour,
  int numOfPets,
) {
  int workHour = startHour + numOfPets;
  String workHourString = workHour.toString();
  if (workHourString.length == 1) {
    workHourString = "0$workHour";
  }

  return "$workHourString:00";
}

String generateWhatsAppUrl(String phone) {
  phone = phone.replaceAll("+", "").trim();
  return "https://api.whatsapp.com/send?phone=" + phone;
}

String generateOrderNo() {
  // unique order number from timestamp
  return "GRM-" + DateFormat('ddMMhhmmss').format(DateTime.now());
}

String titleByDate(DateTime date) {
  DateTime now = DateTime.now();
  var days = 0;
  days = (date.difference(now).inHours / 24).round();

  print(date);

  if (days == 0) {
    return "Hari Ini";
  } else if (days == 1) {
    return "Besok";
  }

  return DateFormat("EEEE, dd MMM", "id_ID").format(date);
}

String localDateString(DateTime date) {
  if(date == null){
    date = DateTime.now();
  }
  return DateFormat("EEEE, dd MMM yyyy", "id_ID").format(date);
}

String generateMapsUrl(LatLng latLng) {
  // google maps url from latlng
  return "https://www.google.com/maps/search/?api=1&query=${latLng.latitude},${latLng.longitude}";
}

double countRating(List<RatingsRecord> rateList) {
  var rate = 0.0;
  for (var ratings in rateList) {
    rate += ratings.rate!;
  }

  return rate / rateList.length;
}

bool isOnQuery(
  CustomersRecord customer,
  String query,
) {
  //if no query then show all
  if (query.isEmpty) {
    return true;
  }

  //if query is phone, normalize WA format
  if (query.contains("+62")) {
    query = query.replaceAll("+62 ", "").replaceAll("-", "");
  }

  if (customer.displayName!.contains(query) ||
      customer.phoneNumber!.contains(query)) {
    return true;
  }
  return false;
}

Future<bool> isCustomerExistsByPhone(String phoneNumber) async {
  // check if document in firebase where phone number exists
  var snapshot = await FirebaseFirestore.instance
      .collection('customers')
      .where('phone_number', isEqualTo: phoneNumber)
      .get();

  if(snapshot.docs.isNotEmpty)
    return true;
  else
    return false;
}

int countSuccessOrder(List<OrdersRecord> orderList) {
  // count total of success order this month
  List<OrdersRecord> _orderList = orderList;
  _orderList.retainWhere((element) => element.status == "Finish");
  _orderList.retainWhere(
          (element) => element.scheduledAt!.month == DateTime.now().month);
  return _orderList.length;
}

int countTotalPets(List<OrdersRecord> orderList) {
  // count total of success order this month
  List<OrdersRecord> _orderList = orderList;
  _orderList.retainWhere((element) => element.status == "Finish");
  _orderList.retainWhere(
      (element) => element.scheduledAt!.month == DateTime.now().month);

  int petCount = 0;
  for (var _rec in _orderList) {
    petCount += _rec.quantity!;
  }

  return petCount;
}

String countAgeString(DateTime dateTime) {
  // string age from datetime
  var age = DateTime.now().difference(dateTime);
  String years = 'year${(age.inDays / 365).floor() > 1 ? 's' : ''}';
  String months = 'month${(age.inDays / 30).floor() > 1 ? 's' : ''}';
  return '${age.inDays ~/ 365} $years ${age.inDays ~/ 30} $months';
}
