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
import 'package:google_fonts/google_fonts.dart';

class EditOrderInformationWidget extends StatefulWidget {
  const EditOrderInformationWidget({
    Key key,
    this.order,
  }) : super(key: key);

  final OrdersRecord order;

  @override
  _EditOrderInformationWidgetState createState() =>
      _EditOrderInformationWidgetState();
}

class _EditOrderInformationWidgetState
    extends State<EditOrderInformationWidget> {
  String petCategoryListValue;
  String petServiceListValue;
  TextEditingController quantityController;
  TextEditingController amountController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    amountController =
        TextEditingController(text: widget.order.amount.toString());
    quantityController =
        TextEditingController(text: widget.order.quantity.toString());
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
                  'Edit Order Information',
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
              child: FlutterFlowDropDown(
                initialOption: petCategoryListValue ??=
                    widget.order.petCategory,
                options: ['Kucing'],
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
                initialOption: petServiceListValue ??= widget.order.service,
                options: ['Mandi Lengkap', 'Mandi Sehat', 'Shaving'],
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
              child: TextFormField(
                controller: quantityController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Jumlah',
                  labelStyle: FlutterFlowTheme.of(context).bodyText2,
                  hintText: '10',
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
                keyboardType: TextInputType.number,
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
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
              child: FFButtonWidget(
                onPressed: () async {
                  final ordersUpdateData = createOrdersRecordData(
                    petCategory: petCategoryListValue,
                    service: petServiceListValue,
                    quantity: int.parse(quantityController.text),
                    amount: double.parse(amountController.text),
                    name:
                        '${petServiceListValue} ${quantityController.text} ${petCategoryListValue}',
                  );
                  await widget.order.reference.update(ordersUpdateData);
                  triggerPushNotification(
                    notificationTitle:
                        'Perubahan Kerjaan ${functions.localDateString(widget.order.scheduledAt)}',
                    notificationText:
                        'Ada kerjaan baru yang ditambahkan untukmu',
                    notificationSound: 'default',
                    userRefs: [FFAppState().selectedRanger],
                    initialPageName: 'Home',
                    parameterData: {},
                  );
                  triggerPushNotification(
                    notificationTitle:
                        'Edit order ${functions.localDateString(widget.order.scheduledAt)}',
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
                text: 'Edit Order',
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
