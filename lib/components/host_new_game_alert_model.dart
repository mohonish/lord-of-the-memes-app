import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/game_lobby/game_lobby_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HostNewGameAlertModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameTextField widget.
  TextEditingController? nameTextFieldController;
  String? Function(BuildContext, String?)? nameTextFieldControllerValidator;
  String? _nameTextFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter your name';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PlayersRow? createdPlayer;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  GameSessionsRow? createdGameSession;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameTextFieldControllerValidator = _nameTextFieldControllerValidator;
  }

  void dispose() {
    nameTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
