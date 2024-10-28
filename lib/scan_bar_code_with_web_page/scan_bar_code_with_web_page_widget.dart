import 'package:register_to_area/custom_toon/CustomCarmera.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_bar_code_with_web_page_model.dart';
export 'scan_bar_code_with_web_page_model.dart';

class ScanBarCodeWithWebPageWidget extends StatefulWidget {
  const ScanBarCodeWithWebPageWidget({super.key});

  @override
  State<ScanBarCodeWithWebPageWidget> createState() =>
      _ScanBarCodeWithWebPageWidgetState();
}

class _ScanBarCodeWithWebPageWidgetState
    extends State<ScanBarCodeWithWebPageWidget> {
  late ScanBarCodeWithWebPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanBarCodeWithWebPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.qrCode = await actions.scanBarCodeWithWeb(
        context,
      );
      if (_model.qrCode != null && _model.qrCode != '') {
        _model.visitorResult = await actions.getVisitorDataByDocID(
          _model.qrCode!,
        );
        if (_model.visitorResult != null) {
          _model.status = await actions.updateTransaction(
            _model.visitorResult!,
          );
          if (_model.status == 1) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('สแกนออกแล้ว'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('ตกลง'),
                    ),
                  ],
                );
              },
            );
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('สแกนเข้าแล้ว'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('ตกลง'),
                    ),
                  ],
                );
              },
            );
          }

          context.safePop();
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('ไม่พบข้อมูลบัตรผ่าน'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('ตกลง'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ไม่พบข้อมูลบัตรผ่าน'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('ตกลง'),
                ),
              ],
            );
          },
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'สแกนบัตรผ่าน',
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 36.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                child: CustomCarmera(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
