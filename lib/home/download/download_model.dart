import '/flutter_flow/flutter_flow_util.dart';
import 'download_widget.dart' show DownloadWidget;
import 'package:flutter/material.dart';

class DownloadModel extends FlutterFlowModel<DownloadWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
