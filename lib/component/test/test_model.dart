import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  Local state fields for this page.

  List<dynamic> dataList = [];
  void addToDataList(dynamic item) => dataList.add(item);
  void removeFromDataList(dynamic item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, dynamic item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(dynamic) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
