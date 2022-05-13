import 'dart:math' as math;

import 'package:flutter/material.dart';
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
