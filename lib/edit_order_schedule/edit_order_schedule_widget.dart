import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/order_created_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class EditOrderScheduleWidget extends StatefulWidget {
  const EditOrderScheduleWidget({
    Key key,
    this.order,
  }) : super(key: key);

  final OrdersRecord order;

  @override
  _EditOrderScheduleWidgetState createState() =>
      _EditOrderScheduleWidgetState();
}

class _EditOrderScheduleWidgetState extends State<EditOrderScheduleWidget> {
  DateTime datePicked;
  String timeListValue;
  TextEditingController endTimeController;
  TextEditingController startTimeController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    endTimeController = TextEditingController(text: widget.order.endTime);
    startTimeController = TextEditingController(text: widget.order.startTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF0F1113),
                          size: 24,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Back',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF0F1113),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                child: Text(
                  'Re-Schedule Order',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF0F1113),
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 40, 24, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          dateTimeFormat('MMMMEEEEd', datePicked),
                          'Tanggal Grooming',
                        ),
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.date_range,
                          color: Color(0xFF1F2126),
                          size: 24,
                        ),
                        onPressed: () async {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked = date);
                            },
                            currentTime: widget.order.scheduledAt,
                            minTime: widget.order.scheduledAt,
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: FlutterFlowDropDown(
                initialOption: timeListValue ??= widget.order.prefferedTime,
                options: ['Pagi', 'Siang', 'Sore'],
                onChanged: (val) => setState(() => timeListValue = val),
                height: 50,
                textStyle: FlutterFlowTheme.of(context).bodyText2,
                hintText: 'Waktu Grooming',
                fillColor: Colors.white,
                elevation: 2,
                borderColor: Colors.transparent,
                borderWidth: 0,
                borderRadius: 0,
                margin: EdgeInsetsDirectional.fromSTEB(22, 4, 12, 4),
                hidesUnderline: true,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                      child: TextFormField(
                        controller: startTimeController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Jam Mulai',
                          labelStyle: FlutterFlowTheme.of(context).bodyText2,
                          hintText: '09:00',
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: TextFormField(
                        controller: endTimeController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Selesai',
                          labelStyle: FlutterFlowTheme.of(context).bodyText2,
                          hintText: '12:00',
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 0,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
              child: FFButtonWidget(
                onPressed: () async {
                  final ordersUpdateData = createOrdersRecordData(
                    scheduledAt: datePicked,
                    prefferedTime: timeListValue,
                    startTime: startTimeController.text,
                    endTime: endTimeController.text,
                  );
                  await widget.order.reference.update(ordersUpdateData);
                  triggerPushNotification(
                    notificationTitle:
                        'Reschedule Kerjaan${functions.localDateString(widget.order.scheduledAt)}  ke ${functions.localDateString(datePicked)}',
                    notificationText:
                        'Ada kerjaan baru yang ditambahkan untukmu',
                    notificationSound: 'default',
                    userRefs: [FFAppState().selectedRanger],
                    initialPageName: 'Home',
                    parameterData: {},
                  );
                  triggerPushNotification(
                    notificationTitle:
                        'Reschedule order${functions.localDateString(widget.order.scheduledAt)} to ${functions.localDateString(datePicked)}',
                    notificationText:
                        'You get this message because your an Admin',
                    userRefs: FFAppState().adminList.toList(),
                    initialPageName: 'OrderList',
                    parameterData: {},
                  );
                  Navigator.pop(context);
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: OrderCreatedWidget(
                          order: widget.order,
                        ),
                      );
                    },
                  );
                },
                text: 'Re-Schedule Order',
                options: FFButtonOptions(
                  width: 270,
                  height: 50,
                  color: Color(0xFF0F1113),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 3,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
