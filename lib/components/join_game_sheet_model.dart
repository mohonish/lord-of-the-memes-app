import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/game_lobby/game_lobby_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JoinGameSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameTextField widget.
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  String? _nameTextFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for codeTextField widget.
  TextEditingController? codeTextFieldController;
  String? Function(BuildContext, String?)? codeTextFieldControllerValidator;
  String? _codeTextFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Your invite code should be 4-6 characters long. Please try again.';
    }
    if (val.length > 6) {
      return 'Your invite code should be 4-6 characters long. Please try again.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Get game session)] action in Button widget.
  ApiCallResponse? currentGameSession;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PlayersRow? createdPlayer;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameTextFieldControllerValidator = _nameTextFieldControllerValidator;
    codeTextFieldControllerValidator = _codeTextFieldControllerValidator;
  }

  void dispose() {
    nameTextFieldController?.dispose();
    codeTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
