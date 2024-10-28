import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transaction_list_page_widget.dart' show TransactionListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionListPageModel
    extends FlutterFlowModel<TransactionListPageWidget> {
  ///  Local state fields for this page.

  List<TransactionListRecord> dataList = [];
  void addToDataList(TransactionListRecord item) => dataList.add(item);
  void removeFromDataList(TransactionListRecord item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, TransactionListRecord item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(TransactionListRecord) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<TransactionListRecord>();
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
    loadingViewModel.dispose();
  }

  /// Action blocks.
  Future initTransactionData(BuildContext context) async {
    List<TransactionListRecord>? dataListResult;

    dataListResult = await queryTransactionListRecordOnce(
      parent: FFAppState().customerData.customerRef,
      queryBuilder: (transactionListRecord) =>
          transactionListRecord.orderBy('date_in', descending: true),
    );
    dataList = dataListResult!.toList().cast<TransactionListRecord>();
  }
}
