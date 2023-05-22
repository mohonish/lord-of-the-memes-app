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
import 'game_lobby_model.dart';
export 'game_lobby_model.dart';

class GameLobbyWidget extends StatefulWidget {
  const GameLobbyWidget({
    Key? key,
    required this.gameSessionId,
    required this.currentPlayerId,
    required this.inviteCode,
  }) : super(key: key);

  final String? gameSessionId;
  final String? currentPlayerId;
  final String? inviteCode;

  @override
  _GameLobbyWidgetState createState() => _GameLobbyWidgetState();
}

class _GameLobbyWidgetState extends State<GameLobbyWidget> {
  late GameLobbyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameLobbyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // poll database
      _model.pollGameSession = InstantTimer.periodic(
        duration: Duration(milliseconds: 3000),
        callback: (timer) async {
          _model.getGameSessionResult = await GetGameSessionWithIDCall.call(
            id: 'eq.${widget.gameSessionId}',
          );
          if ((_model.getGameSessionResult?.succeeded ?? true)) {
            setState(() {
              _model.joinedPlayers = (getJsonField(
                (_model.getGameSessionResult?.jsonBody ?? ''),
                r'''$[0].joined_players''',
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList();
              _model.currentRoundId = getJsonField(
                (_model.getGameSessionResult?.jsonBody ?? ''),
                r'''$[0].current_round''',
              ).toString().toString();
              _model.hostPlayerId = getJsonField(
                (_model.getGameSessionResult?.jsonBody ?? ''),
                r'''$[0].host_player_id''',
              ).toString().toString();
            });
            if (getJsonField(
                  (_model.getGameSessionResult?.jsonBody ?? ''),
                  r'''$[0].current_round''',
                ) !=
                null) {
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => GamePromptPageWidget(
                    currentPlayerId: widget.currentPlayerId!,
                    gameSessionId: widget.gameSessionId!,
                    gameRoundId: getJsonField(
                      (_model.getGameSessionResult?.jsonBody ?? ''),
                      r'''$[0].current_round''',
                    ).toString().toString(),
                    numberOfPlayers: functions.getListLength((getJsonField(
                      (_model.getGameSessionResult?.jsonBody ?? ''),
                      r'''$[0].joined_players''',
                    ) as List)
                        .map<String>((s) => s.toString())
                        .toList())!,
                  ),
                ),
                (r) => false,
              );
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Lobby',
            textAlign: TextAlign.center,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0x00D8D8D8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Here is your invite code: ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Piazzolla',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: widget.inviteCode!,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Piazzolla',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).headlineLarge,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: Text(
                          'Share this code with your friends to invite them to join this game',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Piazzolla',
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x00D8D8D8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Players in this Lobby',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Piazzolla',
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final playerIds =
                                        _model.joinedPlayers.toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: playerIds.length,
                                      itemBuilder: (context, playerIdsIndex) {
                                        final playerIdsItem =
                                            playerIds[playerIdsIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 6.0),
                                          child:
                                              FutureBuilder<List<PlayersRow>>(
                                            future:
                                                PlayersTable().querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'id',
                                                playerIdsItem,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitThreeBounce(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PlayersRow>
                                                  textPlayersRowList =
                                                  snapshot.data!;
                                              final textPlayersRow =
                                                  textPlayersRowList.isNotEmpty
                                                      ? textPlayersRowList.first
                                                      : null;
                                              return Text(
                                                textPlayersRow!.name,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Piazzolla',
                                                        ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 24.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x00D8D8D8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Text(
                                  'Best to have at least 3 or more players',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Piazzolla',
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              if (widget.currentPlayerId != _model.hostPlayerId)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    'When all players are in the lobby, ask your host to start the game',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Piazzolla',
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              if (_model.hostPlayerId == widget.currentPlayerId)
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.getRandomPromptResult =
                                        await GetRandomPromptCall.call();
                                    _shouldSetState = true;
                                    if ((_model
                                            .getRandomPromptResult?.succeeded ??
                                        true)) {
                                      // Create game round
                                      _model.createdGameRound =
                                          await GameRoundsTable().insert({
                                        'prompt_id': getJsonField(
                                          (_model.getRandomPromptResult
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$[0].id''',
                                        ).toString(),
                                        'player_ids': _model.joinedPlayers,
                                      });
                                      _shouldSetState = true;
                                      // Update game session
                                      await GameSessionsTable().update(
                                        data: {
                                          'current_round':
                                              _model.createdGameRound?.id,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.gameSessionId,
                                        ),
                                      );
                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GamePromptPageWidget(
                                            currentPlayerId:
                                                widget.currentPlayerId!,
                                            gameSessionId:
                                                widget.gameSessionId!,
                                            gameRoundId:
                                                _model.createdGameRound!.id,
                                            numberOfPlayers: _model
                                                .createdGameRound!
                                                .playerIds
                                                .length,
                                          ),
                                        ),
                                        (r) => false,
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Error starting round. Please try again.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'Start Game',
                                  options: FFButtonOptions(
                                    width: 170.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
