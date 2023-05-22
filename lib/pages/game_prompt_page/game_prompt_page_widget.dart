import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_prompt_page_model.dart';
export 'game_prompt_page_model.dart';

class GamePromptPageWidget extends StatefulWidget {
  const GamePromptPageWidget({
    Key? key,
    required this.currentPlayerId,
    required this.gameSessionId,
    required this.gameRoundId,
    required this.numberOfPlayers,
  }) : super(key: key);

  final String? currentPlayerId;
  final String? gameSessionId;
  final String? gameRoundId;
  final int? numberOfPlayers;

  @override
  _GamePromptPageWidgetState createState() => _GamePromptPageWidgetState();
}

class _GamePromptPageWidgetState extends State<GamePromptPageWidget> {
  late GamePromptPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamePromptPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Get game round
      _model.getGameRoundResult = await GetGameRoundCall.call(
        id: 'eq.${widget.gameRoundId}',
      );
      if ((_model.getGameRoundResult?.succeeded ?? true)) {
        // Get prompt
        _model.getGamePromptResult = await GetPromptWithIdCall.call(
          id: 'eq.${getJsonField(
            (_model.getGameRoundResult?.jsonBody ?? ''),
            r'''$[0].prompt_id''',
          ).toString().toString()}',
        );
        if ((_model.getGamePromptResult?.succeeded ?? true)) {
          setState(() {
            _model.isLoadingPrompt = false;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error fetching prompt',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          return;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error fetching game round',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        return;
      }
    });

    _model.textController ??= TextEditingController();
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
            'Game',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: !_model.isLoadingPrompt,
                    child: Text(
                      getJsonField(
                        (_model.getGamePromptResult?.jsonBody ?? ''),
                        r'''$[0].title''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'What would be a funny meme / gif response for this situation?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Piazzolla',
                            ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 0.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.textController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Search using Tenor Gif Library',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Piazzolla',
                                  ),
                              textAlign: TextAlign.start,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            _model.gifSearchResult =
                                await TenorGifSearchCall.call(
                              q: _model.textController.text,
                            );
                            _shouldSetState = true;
                            if ((_model.gifSearchResult?.succeeded ?? true)) {
                              _model.searchResults = getJsonField(
                                (_model.gifSearchResult?.jsonBody ?? ''),
                                r'''$.results''',
                              )!
                                  .toList();
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: 'Search',
                          options: FFButtonOptions(
                            width: 120.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
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
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final searchResultGifs = _model.searchResults.toList();
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: searchResultGifs.length,
                        itemBuilder: (context, searchResultGifsIndex) {
                          final searchResultGifsItem =
                              searchResultGifs[searchResultGifsIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ConfirmMemePage',
                                queryParams: {
                                  'currentPlayerId': serializeParam(
                                    widget.currentPlayerId,
                                    ParamType.String,
                                  ),
                                  'gameSessionId': serializeParam(
                                    widget.gameSessionId,
                                    ParamType.String,
                                  ),
                                  'gameRoundId': serializeParam(
                                    widget.gameRoundId,
                                    ParamType.String,
                                  ),
                                  'promptText': serializeParam(
                                    getJsonField(
                                      (_model.getGamePromptResult?.jsonBody ??
                                          ''),
                                      r'''$[0].title''',
                                    ).toString(),
                                    ParamType.String,
                                  ),
                                  'memeUrl': serializeParam(
                                    getJsonField(
                                      searchResultGifsItem,
                                      r'''$.media_formats.gif.url''',
                                    ),
                                    ParamType.String,
                                  ),
                                  'numberOfPlayers': serializeParam(
                                    widget.numberOfPlayers,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.bottomToTop,
                                  ),
                                },
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                getJsonField(
                                  searchResultGifsItem,
                                  r'''$.media_formats.tinygif.url''',
                                ),
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    },
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
