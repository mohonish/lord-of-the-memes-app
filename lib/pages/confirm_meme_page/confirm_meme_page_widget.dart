import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/waiting_for_page/waiting_for_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_meme_page_model.dart';
export 'confirm_meme_page_model.dart';

class ConfirmMemePageWidget extends StatefulWidget {
  const ConfirmMemePageWidget({
    Key? key,
    required this.currentPlayerId,
    required this.gameSessionId,
    required this.gameRoundId,
    required this.promptText,
    required this.memeUrl,
    required this.numberOfPlayers,
  }) : super(key: key);

  final String? currentPlayerId;
  final String? gameSessionId;
  final String? gameRoundId;
  final String? promptText;
  final String? memeUrl;
  final int? numberOfPlayers;

  @override
  _ConfirmMemePageWidgetState createState() => _ConfirmMemePageWidgetState();
}

class _ConfirmMemePageWidgetState extends State<ConfirmMemePageWidget> {
  late ConfirmMemePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmMemePageModel());

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Confirm',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Piazzolla',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      widget.promptText!,
                      maxLines: 5,
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 500.0,
                  height: 500.0,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      widget.memeUrl!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 24.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await MemeSubmissionsTable().insert({
                                'game_round_id': widget.gameRoundId,
                                'player_id': widget.currentPlayerId,
                                'meme_url': widget.memeUrl,
                              });
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WaitingForPageWidget(
                                    gameSessionId: widget.gameSessionId!,
                                    gameRoundId: widget.gameRoundId!,
                                    currentPlayerId: widget.currentPlayerId!,
                                    numberOfPlayers: widget.numberOfPlayers!,
                                    promptText: widget.promptText!,
                                  ),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Confirm choice',
                            options: FFButtonOptions(
                              width: 200.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'Go Back',
                            options: FFButtonOptions(
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
