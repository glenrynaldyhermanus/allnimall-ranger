import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateOrderWidget extends StatefulWidget {
  const CreateOrderWidget({Key key}) : super(key: key);

  @override
  _CreateOrderWidgetState createState() => _CreateOrderWidgetState();
}

class _CreateOrderWidgetState extends State<CreateOrderWidget> {
  DateTime datePicked1;
  TextEditingController scheduledAtController1;
  String petCategoryListValue;
  String petServiceListValue;
  String quantityListValue;
  TextEditingController amountController;
  TextEditingController preferedTimeController;
  TextEditingController startTimeController;
  TextEditingController endTimeController;
  String customerListValue1;
  TextEditingController customerAddressController;
  String customerListValue2;
  DateTime datePicked2;
  TextEditingController scheduledAtController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    scheduledAtController1 = TextEditingController();
    preferedTimeController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    customerAddressController = TextEditingController();
    scheduledAtController2 = TextEditingController();
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
                  'Create Order',
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
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: FlutterFlowDropDown(
                options: ['Kucing'].toList(),
                onChanged: (val) => setState(() => petCategoryListValue = val),
                height: 50,
                textStyle: FlutterFlowTheme.of(context).bodyText2,
                hintText: 'Pet Category',
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
              child: FlutterFlowDropDown(
                options: ['Mandi Lengkap', 'Mandi Sehat', 'Shaving'].toList(),
                onChanged: (val) => setState(() => petServiceListValue = val),
                height: 50,
                textStyle: FlutterFlowTheme.of(context).bodyText2,
                hintText: 'Service',
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
              child: FlutterFlowDropDown(
                options: ['1', '2', '3', '4', '5', '6', '7', '8', '9'].toList(),
                onChanged: (val) => setState(() => quantityListValue = val),
                height: 50,
                textStyle: FlutterFlowTheme.of(context).bodyText2,
                hintText: 'Jumlah',
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
              child: TextFormField(
                controller: amountController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Total Bayar',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: '65000',
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
                  contentPadding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 40, 24, 0),
              child: TextFormField(
                controller: scheduledAtController1,
                onFieldSubmitted: (_) async {
                  await DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      setState(() => datePicked1 = date);
                    },
                    currentTime: getCurrentTimestamp,
                    minTime: getCurrentTimestamp,
                  );
                },
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Tanggal Grooming',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: 'Apr 25, 2022',
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
                  contentPadding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: TextFormField(
                controller: preferedTimeController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Waktu Grooming',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: '65000',
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
                  contentPadding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: TextFormField(
                controller: startTimeController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Mulai Grooming',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: '65000',
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
                  contentPadding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: TextFormField(
                controller: endTimeController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Selesai Grooming',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: '65000',
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
                  contentPadding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 40, 24, 0),
              child: FlutterFlowDropDown(
                options: ['Glen'].toList(),
                onChanged: (val) => setState(() => customerListValue1 = val),
                height: 50,
                textStyle: FlutterFlowTheme.of(context).bodyText2,
                hintText: 'Customer',
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
              child: TextFormField(
                controller: customerAddressController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Alamat Customer',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: '65000',
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
                  contentPadding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 40, 24, 0),
              child: FlutterFlowDropDown(
                options: ['Glen'].toList(),
                onChanged: (val) => setState(() => customerListValue2 = val),
                height: 50,
                textStyle: FlutterFlowTheme.of(context).bodyText2,
                hintText: 'Ranger',
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
              padding: EdgeInsetsDirectional.fromSTEB(24, 40, 24, 0),
              child: TextFormField(
                controller: scheduledAtController2,
                onFieldSubmitted: (_) async {
                  await DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      setState(() => datePicked2 = date);
                    },
                    currentTime: getCurrentTimestamp,
                    minTime: getCurrentTimestamp,
                  );
                },
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Catatan',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
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
                  contentPadding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                ),
                style: FlutterFlowTheme.of(context).bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button-Login pressed ...');
                },
                text: 'Create Order',
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
                  borderRadius: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
