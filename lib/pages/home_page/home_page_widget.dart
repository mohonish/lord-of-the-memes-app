import '/components/about_popup_widget.dart';
import '/components/host_new_game_alert_widget.dart';
import '/components/join_game_alert_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/crown.png',
                        width: 120.0,
                        height: 90.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 48.0),
                    child: Text(
                      'Lord Of The Memes',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displayLarge.override(
                            fontFamily: 'Piazzolla',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
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
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_unfocusNode),
                                  child: HostNewGameAlertWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Host New Game',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
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
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
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
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_unfocusNode),
                                  child: JoinGameAlertWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Join Game',
                        options: FFButtonOptions(
                          width: 150.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
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
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () async {
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
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_unfocusNode),
                                  child: AboutPopupWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'About',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
