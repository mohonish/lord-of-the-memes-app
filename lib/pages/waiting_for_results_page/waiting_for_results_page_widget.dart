import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'waiting_for_results_page_model.dart';
export 'waiting_for_results_page_model.dart';

class WaitingForResultsPageWidget extends StatefulWidget {
  const WaitingForResultsPageWidget({
    Key? key,
    required this.gameSessionId,
    required this.gameRoundId,
    required this.currentPlayerId,
    required this.numberOfPlayers,
    required this.promptText,
  }) : super(key: key);

  final String? gameSessionId;
  final String? gameRoundId;
  final String? currentPlayerId;
  final int? numberOfPlayers;
  final String? promptText;

  @override
  _WaitingForResultsPageWidgetState createState() =>
      _WaitingForResultsPageWidgetState();
}

class _WaitingForResultsPageWidgetState
    extends State<WaitingForResultsPageWidget> {
  late WaitingForResultsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitingForResultsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          _model.getRatingsCountResult = await GetRatingsCountCall.call(
            paramRoundId: widget.gameRoundId,
          );
          if ((_model.getRatingsCountResult?.succeeded ?? true)) {
            setState(() {
              _model.waitingForRatingsCount =
                  functions.getExpectedRatingsCount(widget.numberOfPlayers!)! -
                      valueOrDefault<int>(
                        getJsonField(
                          (_model.getRatingsCountResult?.jsonBody ?? ''),
                          r'''$''',
                        ),
                        0,
                      );
            });
            if (getJsonField(
                  (_model.getRatingsCountResult?.jsonBody ?? ''),
                  r'''$''',
                ) ==
                functions.getExpectedRatingsCount(widget.numberOfPlayers!)) {
              context.goNamed(
                'ResultsPage',
                queryParams: {
                  'gameSessionId': serializeParam(
                    widget.gameSessionId,
                    ParamType.String,
                  ),
                  'gameRoundId': serializeParam(
                    widget.gameRoundId,
                    ParamType.String,
                  ),
                  'currentPlayerId': serializeParam(
                    widget.currentPlayerId,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );

              return;
            } else {
              return;
            }
          } else {
            return;
          }
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Text(
                    'Waiting for',
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.waitingForRatingsCount?.toString(),
                    '-',
                  ),
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontFamily: 'Piazzolla',
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'memes to be rated',
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                  child: Text(
                    'and not just laughed at',
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Text(
                    '(This page will automatically refresh)',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Piazzolla',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
