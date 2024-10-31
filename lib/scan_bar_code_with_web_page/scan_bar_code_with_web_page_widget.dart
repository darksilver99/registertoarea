import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/info_custom_view_widget.dart';
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
  const ScanBarCodeWithWebPageWidget({
    super.key,
    bool? isEnter,
  }) : this.isEnter = isEnter ?? true;

  final bool isEnter;

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
          _model.statusResult = await actions.updateTransaction(
            _model.visitorResult!,
            widget!.isEnter,
          );
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: InfoCustomViewWidget(
                  title: _model.statusResult!.msg,
                  status:
                      _model.statusResult?.status == 1 ? 'success' : 'error',
                ),
              );
            },
          );

          context.safePop();
        } else {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: InfoCustomViewWidget(
                  title: 'ไม่พบข้อมูลบัตรผ่าน',
                  status: 'error',
                ),
              );
            },
          );

          context.safePop();
        }
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: InfoCustomViewWidget(
                title: 'ไม่พบข้อมูลบัตรผ่าน',
                status: 'error',
              ),
            );
          },
        );

        context.safePop();
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
    return Builder(
      builder: (context) => Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
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
