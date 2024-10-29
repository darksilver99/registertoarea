import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:register_to_area/backend/schema/visitor_record.dart';
import 'package:register_to_area/custom_toon/custom_toon.dart';
import 'package:register_to_area/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class VisitorDataTableView extends StatefulWidget {
  const VisitorDataTableView({super.key});

  @override
  State<VisitorDataTableView> createState() => _VisitorDataTableViewState();
}

class _VisitorDataTableViewState extends State<VisitorDataTableView> {
  List<dynamic> headerList = [
    {
      "subject": "รหัสบัตร",
      "width": 150,
    },
    {
      "subject": "ชื่อ-นามสกุล",
      "width": 250,
    },
    {
      "subject": "สังกัดบริษัท",
      "width": 250,
    },
    {
      "subject": "ทะเบียน",
      "width": 150,
    },
    {
      "subject": "วันที่หมดอายุบัตร",
      "width": 150,
    },
    {
      "subject": "จัดการข้อมูล",
      "width": 200,
    },
  ];

  late List<VisitorRecord> dataList;
  int totalData = 0;
  bool isFirstPage = true;
  bool isLastPage = false;
  bool isLoading = true;
  DocumentSnapshot? lastDocument;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      dataList = await getVisitorDataList(null);
      if (dataList.isNotEmpty) {
        lastDocument = await dataList.last.reference.get();
      }
      totalData = await getVisitorDataCount();
      isLoading = false;
      setState(() {});
    });
  }

  String _getDataInColumn(VisitorRecord dataListViewItem, String subject) {
    switch (subject) {
      case "รหัสบัตร":
        return dataListViewItem.cardNo;
      case "ชื่อ-นามสกุล":
        return dataListViewItem.fullName;
      case "สังกัดบริษัท":
        return dataListViewItem.company;
      case "ทะเบียน":
        return dataListViewItem.carNumber;
      case "วันที่หมดอายุบัตร":
        return functions.dateTh(dataListViewItem.expireDate) ?? "-";
      case "จัดการข้อมูล":
        return dataListViewItem.reference.id;
      default:
        return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!isLoading)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width:
                        headerList.fold(0, (sum, item) => sum! + item['width']),
                    height: 750,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              for (final header in headerList)
                                Container(
                                  width: header["width"],
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          header["subject"],
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final dataListView = dataList.toList();
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(dataListView.length,
                                    (dataListViewIndex) {
                                  final dataListViewItem =
                                      dataListView[dataListViewIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      for (final header in headerList)
                                        Container(
                                          width: header["width"],
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  _getDataInColumn(
                                                      dataListViewItem,
                                                      header["subject"]),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {},
                                      child: Icon(
                                        Icons.chevron_left_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          dataList = await getVisitorDataList(
                                              lastDocument);
                                          if (dataList.isNotEmpty) {
                                            lastDocument = await dataList
                                                .last.reference
                                                .get();
                                          }
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.navigate_next_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '$totalData รายการ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
