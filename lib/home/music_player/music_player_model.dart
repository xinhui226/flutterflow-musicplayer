import '/flutter_flow/flutter_flow_util.dart';
import 'music_player_widget.dart' show MusicPlayerWidget;
import 'package:flutter/material.dart';

class MusicPlayerModel extends FlutterFlowModel<MusicPlayerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
