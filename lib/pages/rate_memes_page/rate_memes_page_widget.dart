import '/backend/supabase/supabase.dart';
import '/components/rate_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/waiting_for_results_page/waiting_for_results_page_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rate_memes_page_model.dart';
export 'rate_memes_page_model.dart';

class RateMemesPageWidget extends StatefulWidget {
  const RateMemesPageWidget({
    Key? key,
    required this.gameSessionId,
    required this.gameRoundId,
    required this.currentPlayerId,
    required this.promptText,
    required this.numberOfPlayers,
  }) : super(key: key);

  final String? gameSessionId;
  final String? gameRoundId;
  final String? currentPlayerId;
  final String? promptText;
  final int? numberOfPlayers;

  @override
  _RateMemesPageWidgetState createState() => _RateMemesPageWidgetState();
}

class _RateMemesPageWidgetState extends State<RateMemesPageWidget> {
  late RateMemesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RateMemesPageModel());

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
            'Time to Rate',
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
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          widget.promptText!,
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 12.0),
                        child: Text(
                          'Select each gif below and choose an emoji to rate them.',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Piazzolla',
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<MemeSubmissionsRow>>(
                    future: MemeSubmissionsTable().queryRows(
                      queryFn: (q) => q
                          .eq(
                            'game_round_id',
                            widget.gameRoundId,
                          )
                          .neq(
                            'player_id',
                            widget.currentPlayerId,
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
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<MemeSubmissionsRow> gridViewMemeSubmissionsRowList =
                          snapshot.data!;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewMemeSubmissionsRowList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewMemeSubmissionsRow =
                              gridViewMemeSubmissionsRowList[gridViewIndex];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Stack(
                              children: [
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showAlignedDialog(
                                        context: context,
                                        isGlobal: true,
                                        avoidOverflow: false,
                                        targetAnchor: Alignment(0.0, 0.0),
                                        followerAnchor: Alignment(0.0, 0.0),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: GestureDetector(
                                              onTap: () => FocusScope.of(
                                                      context)
                                                  .requestFocus(_unfocusNode),
                                              child: RateCardWidget(
                                                gameRoundId:
                                                    widget.gameRoundId!,
                                                memeSubmissionId:
                                                    gridViewMemeSubmissionsRow
                                                        .id,
                                                currentPlayerId:
                                                    widget.currentPlayerId!,
                                                promptText: widget.promptText!,
                                                memeUrl:
                                                    gridViewMemeSubmissionsRow
                                                        .memeUrl,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        gridViewMemeSubmissionsRow.memeUrl,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                FutureBuilder<List<RatingsRow>>(
                                  future: RatingsTable().querySingleRow(
                                    queryFn: (q) => q
                                        .eq(
                                          'game_round_id',
                                          widget.gameRoundId,
                                        )
                                        .eq(
                                          'meme_submission_id',
                                          gridViewMemeSubmissionsRow.id,
                                        )
                                        .eq(
                                          'from_player_id',
                                          widget.currentPlayerId,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<RatingsRow> containerRatingsRowList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerRatingsRow =
                                        containerRatingsRowList.isNotEmpty
                                            ? containerRatingsRowList.first
                                            : null;
                                    return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x7F14181B),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            () {
                                              if (containerRatingsRow?.value ==
                                                  2) {
                                                return '🤣';
                                              } else if (containerRatingsRow
                                                      ?.value ==
                                                  1) {
                                                return '😀';
                                              } else {
                                                return '🤔';
                                              }
                                            }(),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: 100.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Please make sure to click on each gif and submit a rating before proceeding.',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Piazzolla',
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      WaitingForResultsPageWidget(
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
                            text: 'Submit Ratings',
                            options: FFButtonOptions(
                              width: 200.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle:
                                  FlutterFlowTheme.of(context).titleSmall,
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
