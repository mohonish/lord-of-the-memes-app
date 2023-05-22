import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/game_prompt_page/game_prompt_page_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GameLobbyModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> joinedPlayers = [];
  void addToJoinedPlayers(String item) => joinedPlayers.add(item);
  void removeFromJoinedPlayers(String item) => joinedPlayers.remove(item);
  void removeAtIndexFromJoinedPlayers(int index) =>
      joinedPlayers.removeAt(index);

  String? currentRoundId;

  String? hostPlayerId;

  ///  State fields for stateful widgets in this page.

  InstantTimer? pollGameSession;
  // Stores action output result for [Backend Call - API (Get game session with ID)] action in GameLobby widget.
  ApiCallResponse? getGameSessionResult;
  // Stores action output result for [Backend Call - API (Get random prompt)] action in Button widget.
  ApiCallResponse? getRandomPromptResult;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  GameRoundsRow? createdGameRound;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    pollGameSession?.cancel();
  }

  /// Additional helper methods are added here.

}
