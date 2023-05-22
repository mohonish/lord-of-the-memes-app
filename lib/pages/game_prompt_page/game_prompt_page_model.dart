import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/confirm_meme_page/confirm_meme_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GamePromptPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoadingPrompt = true;

  List<dynamic> searchResults = [];
  void addToSearchResults(dynamic item) => searchResults.add(item);
  void removeFromSearchResults(dynamic item) => searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Get game round)] action in GamePromptPage widget.
  ApiCallResponse? getGameRoundResult;
  // Stores action output result for [Backend Call - API (Get prompt with id)] action in GamePromptPage widget.
  ApiCallResponse? getGamePromptResult;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Tenor Gif Search)] action in Button widget.
  ApiCallResponse? gifSearchResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
