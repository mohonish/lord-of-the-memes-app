import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'about_popup_model.dart';
export 'about_popup_model.dart';

class AboutPopupWidget extends StatefulWidget {
  const AboutPopupWidget({Key? key}) : super(key: key);

  @override
  _AboutPopupWidgetState createState() => _AboutPopupWidgetState();
}

class _AboutPopupWidgetState extends State<AboutPopupWidget> {
  late AboutPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutPopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550.0,
      height: 450.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                child: Text(
                  'About the game',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
              ),
              Container(
                width: 500.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'So you\'re chilling with your friends. But you have nothing to do. The dog is sleeping. You pull out your phone and start scrolling memes. Maybe you even share a few with each other.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Piazzolla',
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'Instead of scrolling for meme gifs, how about you play a game together with your friends? It\'s gonna be as fun as looking at memes.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Piazzolla',
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'Let\'s play Lord Of The Memes.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Piazzolla',
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'It is a fun live multiplayer game where you and your friends have to select the most appropriate gif for a randomly provided prompt.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Piazzolla',
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'After every player has selected their gif / meme, it is time to rate each other\'s selections.  How funny are they?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Piazzolla',
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'At the end of the game, one of your friends is crowned the Meme Lord.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Piazzolla',
                                  ),
                        ),
                      ),
                      Text(
                        'But how long, before they\'re de-throned?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Piazzolla',
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 0.0),
                child: Text(
                  'Notes from the developer',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
              ),
              Container(
                width: 500.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'Built for the Supabase Flutter Hackathon using FlutterFlow. The entire web app has been built using FlutterFlow end to end. Supabase is used for the hosted Postgres DB and functions.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Piazzolla',
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          'Gif Search using Tenor API',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Piazzolla',
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
