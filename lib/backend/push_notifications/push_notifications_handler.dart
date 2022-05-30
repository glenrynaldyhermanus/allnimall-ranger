import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBtnText,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/Artboard1_4.png',
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'SignIn': (data) async => SignInWidget(),
  'OrderRequest': (data) async => NavBarPage(initialPage: 'OrderRequest'),
  'RequestDetail': (data) async => RequestDetailWidget(
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
  'OrderDetail': (data) async => OrderDetailWidget(
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
  'SignUp': (data) async => SignUpWidget(),
  'Menu': (data) async => MenuWidget(),
  'CreateOrder': (data) async => CreateOrderWidget(),
  'CalendarPickers': (data) async => CalendarPickersWidget(),
  'CreateCustomer': (data) async => CreateCustomerWidget(),
  'CustomerList': (data) async => CustomerListWidget(),
  'RangerList': (data) async => RangerListWidget(),
  'CreateHistoricalOrder': (data) async => CreateHistoricalOrderWidget(),
  'OrderList': (data) async => OrderListWidget(),
  'OrderDetailCopy': (data) async => OrderDetailCopyWidget(
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
