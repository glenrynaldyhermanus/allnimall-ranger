import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/calendar_picker_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../menu/menu_widget.dart';
import '../order_detail/order_detail_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().filterDate = getCurrentTimestamp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: Text(
                functions.titleByDate(FFAppState().filterDate ??  DateTime.now()),
                style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20,
                borderWidth: 1,
                buttonSize: 40,
                fillColor: Color(0x27EF487F),
                icon: Icon(
                  Icons.date_range_outlined,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  size: 20,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: CalendarPickerWidget(),
                      );
                    },
                  ).then((value) {
                    setState(() {});
                  });
                },
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 44,
              icon: Icon(
                Icons.menu,
                color: Color(0xFF57636C),
                size: 24,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuWidget(),
                  ),
                );
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Jadwal kamu hari ${functions.localDateString(FFAppState().filterDate ?? DateTime.now())}',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              if ((valueOrDefault(currentUserDocument?.role, '')) != 'Admin')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: AuthUserStreamWidget(
                    child: StreamBuilder<List<OrdersRecord>>(
                      stream: queryOrdersRecord(
                        queryBuilder: (ordersRecord) => ordersRecord
                            .where('ranger_uid',
                            isEqualTo: currentUserReference)
                            .where('scheduled_at',
                            isGreaterThanOrEqualTo: functions
                                .dateStart(FFAppState().filterDate!))
                            .where('scheduled_at',
                            isLessThanOrEqualTo:
                            functions.dateEnd(FFAppState().filterDate!))
                            .where('status', whereIn: [
                          "Confirmed",
                          "OnTheWay",
                          "Working",
                          "Finish"
                        ])
                            .orderBy('scheduled_at')
                            .orderBy('start_time'),
                        limit: 10,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<OrdersRecord> listViewOrdersRecordList =
                        snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewOrdersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewOrdersRecord =
                            listViewOrdersRecordList[listViewIndex];
                            return Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderDetailWidget(
                                        order: listViewOrdersRecord,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x411D2429),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 15, 10, 15),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        if ((listViewOrdersRecord.status) !=
                                            'Finish')
                                          Container(
                                            width: 64,
                                            decoration: BoxDecoration(
                                              color: Color(0x34EF487F),
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
                                            child: Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 0, 5),
                                                child: AutoSizeText(
                                                  listViewOrdersRecord
                                                      .startTime!
                                                      .maybeHandleOverflow(
                                                    maxChars: 70,
                                                    replacement: '…',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText2
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    Color(0xFF3B4043),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((listViewOrdersRecord.status) ==
                                            'Finish')
                                          Container(
                                            width: 64,
                                            decoration: BoxDecoration(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary400,
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 5),
                                              child: Text(
                                                'Selesai',
                                                textAlign: TextAlign.center,
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme
                                                      .of(context)
                                                      .primaryBtnText,
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10, 0, 10, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewOrdersRecord.name!,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .title3
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    Color(0xFF0F1113),
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 8, 0),
                                                  child: AutoSizeText(
                                                    listViewOrdersRecord
                                                        .customerAddress!
                                                        .maybeHandleOverflow(
                                                      maxChars: 70,
                                                      replacement: '…',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                      Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              if ((valueOrDefault(currentUserDocument?.role, '')) == 'Admin')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: AuthUserStreamWidget(
                    child: StreamBuilder<List<OrdersRecord>>(
                      stream: queryOrdersRecord(
                        queryBuilder: (ordersRecord) => ordersRecord
                            .where('scheduled_at',
                            isGreaterThanOrEqualTo: functions
                                .dateStart(FFAppState().filterDate ?? DateTime.now()))
                            .where('scheduled_at',
                            isLessThanOrEqualTo:
                            functions.dateEnd(FFAppState().filterDate ?? DateTime.now()))
                            .where('status', whereIn: [
                          "Confirmed",
                          "OnTheWay",
                          "Working",
                          "Finish"
                        ])
                            .orderBy('scheduled_at')
                            .orderBy('start_time'),
                        limit: 10,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<OrdersRecord> listViewOrdersRecordList =
                        snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewOrdersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewOrdersRecord =
                            listViewOrdersRecordList[listViewIndex];
                            return Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderDetailWidget(
                                        order: listViewOrdersRecord,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x411D2429),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 15, 10, 15),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((listViewOrdersRecord
                                                    .status) !=
                                                    'Finish')
                                                  Container(
                                                    width: 64,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x34EF487F),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          16),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 5, 0, 5),
                                                        child: AutoSizeText(
                                                          listViewOrdersRecord
                                                              .startTime!
                                                              .maybeHandleOverflow(
                                                            maxChars: 70,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                          TextAlign.start,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyText2
                                                              .override(
                                                            fontFamily:
                                                            'Outfit',
                                                            color: Color(
                                                                0xFF3B4043),
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight
                                                                .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if ((listViewOrdersRecord
                                                    .status) ==
                                                    'Finish')
                                                  Container(
                                                    width: 64,
                                                    decoration: BoxDecoration(
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .tertiary400,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          16),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 5, 0, 5),
                                                      child: Text(
                                                        'Selesai',
                                                        textAlign:
                                                        TextAlign.center,
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primaryBtnText,
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight
                                                              .normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10, 0, 10, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewOrdersRecord.name!,
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .title3
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    Color(0xFF0F1113),
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.emoji_people,
                                                          color: Colors.black,
                                                          size: 16,
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0,
                                                              4, 8, 0),
                                                          child: AutoSizeText(
                                                            listViewOrdersRecord
                                                                .rangerName!
                                                                .maybeHandleOverflow(
                                                              maxChars: 70,
                                                              replacement: '…',
                                                            ),
                                                            textAlign:
                                                            TextAlign.start,
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyText2
                                                                .override(
                                                              fontFamily:
                                                              'Poppins',
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                            color: Colors.black,
                                                            size: 16,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0,
                                                                4,
                                                                8,
                                                                0),
                                                            child: Text(
                                                              formatNumber(
                                                                listViewOrdersRecord
                                                                    .amount,
                                                                formatType:
                                                                FormatType
                                                                    .decimal,
                                                                decimalType:
                                                                DecimalType
                                                                    .commaDecimal,
                                                                currency: 'Rp',
                                                              ),
                                                              textAlign:
                                                              TextAlign.end,
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                fontFamily:
                                                                'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryColor,
                                                                fontSize:
                                                                12,
                                                                fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 8, 0),
                                                  child: AutoSizeText(
                                                    listViewOrdersRecord
                                                        .customerAddress!
                                                        .maybeHandleOverflow(
                                                      maxChars: 70,
                                                      replacement: '…',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                      Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}