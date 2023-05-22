import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultsPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  dynamic winner;

  dynamic mostUnimpressed;

  dynamic mostHappy;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get winner)] action in ResultsPage widget.
  ApiCallResponse? getWinningSubmissionIdResult;
  // Stores action output result for [Backend Call - API (Get happy player)] action in ResultsPage widget.
  ApiCallResponse? getHappyPlayerResponse;
  // Stores action output result for [Backend Call - API (Get unamused player)] action in ResultsPage widget.
  ApiCallResponse? getUnamusedPlayerResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
