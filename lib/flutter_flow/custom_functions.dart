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
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 0, 0, 0);
}

DateTime dateEnd(DateTime timestamp) {
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

  if (days == 0) {
    return "Hari Ini";
  } else if (days == 1) {
    return "Besok";
  }

  return DateFormat("EEEE, dd MMM", "id_ID").format(date);
}

String localDateString(DateTime date) {
  return DateFormat("EEEE, dd MMM yyyy", "id_ID").format(date);
}

String generateMapsUrl(LatLng latLng) {
  // google maps url from latlng
  return "https://www.google.com/maps/search/?api=1&query=${latLng.latitude},${latLng.longitude}";
}

double countRating(List<RatingsRecord> rateList) {
  var rate = 0.0;
  for (var ratings in rateList) {
    rate += ratings.rate;
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

  if (customer.displayName.contains(query) ||
      customer.phoneNumber.contains(query)) {
    return true;
  }
  return false;
}
