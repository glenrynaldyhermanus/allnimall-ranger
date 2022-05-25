import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateCustomerWidget extends StatefulWidget {
  const CreateCustomerWidget({Key key}) : super(key: key);

  @override
  _CreateCustomerWidgetState createState() => _CreateCustomerWidgetState();
}

class _CreateCustomerWidgetState extends State<CreateCustomerWidget> {
  LatLng googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  TextEditingController addressController;
  var placePickerValue = FFPlace(latLng: LatLng(-6.3455171, 106.8316923));
  TextEditingController handphoneController;
  TextEditingController nameController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: placePickerValue.address);
    handphoneController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
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
                        style: FlutterFlowTheme
                            .of(context)
                            .title1
                            .override(
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
                  'Create Customer',
                  style: FlutterFlowTheme
                      .of(context)
                      .title1
                      .override(
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
              child: TextFormField(
                controller: nameController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  labelStyle: FlutterFlowTheme
                      .of(context)
                      .bodyText2,
                  hintText: 'Glen Rynaldy Hermanus',
                  hintStyle: FlutterFlowTheme
                      .of(context)
                      .bodyText2,
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
                style: FlutterFlowTheme
                    .of(context)
                    .bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: TextFormField(
                controller: handphoneController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Handphone',
                  labelStyle: FlutterFlowTheme
                      .of(context)
                      .bodyText2,
                  hintText: '+6281314169140',
                  hintStyle: FlutterFlowTheme
                      .of(context)
                      .bodyText2,
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
                style: FlutterFlowTheme
                    .of(context)
                    .bodyText2,
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 40, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: addressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        labelStyle: FlutterFlowTheme
                            .of(context)
                            .bodyText2,
                        hintText:
                        'Jalan Lenteng Agung Raya No 62 Jakarta Selatan',
                        hintStyle: FlutterFlowTheme
                            .of(context)
                            .bodyText2,
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
                      style: FlutterFlowTheme
                          .of(context)
                          .bodyText2,
                    ),
                  ),
                  FlutterFlowPlacePicker(
                    iOSGoogleMapsApiKey:
                    'AIzaSyAX9Kl_giqmL8K8JGZlFN6RaPLxq6g6Xp0',
                    androidGoogleMapsApiKey:
                    'AIzaSyBydXSoppRjB-gdhCkIckjS0O_t9hzMgtw',
                    webGoogleMapsApiKey:
                    'AIzaSyAVmO1JRU552L2OhuDi0sdRhwgleBPNO3c',
                    onSelect: (place) =>
                        setState(() {
                          placePickerValue = place;
                          var newPosition = CameraPosition(
                              target: placePickerValue.latLng.toGoogleMaps(),
                              zoom: 16);
                          CameraUpdate update = CameraUpdate.newCameraPosition(
                              newPosition);
                          CameraUpdate zoom = CameraUpdate.zoomTo(16);
                          googleMapsController.future.then((controller) {
                            controller.animateCamera(update);
                          });
                          addressController.text = placePickerValue.address;
                        }),
                    defaultText: '',
                    icon: Icon(
                      Icons.place,
                      color: Colors.white,
                      size: 20,
                    ),
                    buttonOptions: FFButtonOptions(
                      width: 44,
                      height: 44,
                      color: FlutterFlowTheme
                          .of(context)
                          .primaryColor,
                      textStyle:
                      FlutterFlowTheme
                          .of(context)
                          .subtitle2
                          .override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 240,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Stack(
                  children: [
                    FlutterFlowGoogleMap(
                      controller: googleMapsController,
                      onCameraIdle: (latLng) => googleMapsCenter = latLng,
                      initialLocation: googleMapsCenter ??=
                          placePickerValue.latLng,
                      markerColor: GoogleMarkerColor.violet,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 14,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: true,
                      showLocation: true,
                      showCompass: false,
                      showMapToolbar: false,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: FlutterFlowTheme
                              .of(context)
                              .primaryColor,
                          size: 48,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
              child: FFButtonWidget(
                onPressed: () async {
                  final customersCreateData = createCustomersRecordData(
                    displayName: nameController.text,
                    phoneNumber: handphoneController.text,
                    orderLatlng: googleMapsCenter,
                    orderAddress: addressController.text,
                    createdTime: getCurrentTimestamp,
                  );
                  await CustomersRecord.collection
                      .doc()
                      .set(customersCreateData);
                  Navigator.pop(context);
                },
                text: 'Create Customer',
                options: FFButtonOptions(
                  width: 270,
                  height: 50,
                  color: Color(0xFF0F1113),
                  textStyle: FlutterFlowTheme
                      .of(context)
                      .subtitle2
                      .override(
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
