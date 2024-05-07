import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'music_player_model.dart';
export 'music_player_model.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({
    super.key,
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  late MusicPlayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicPlayerModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MusicRecord>>(
      stream: queryMusicRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<MusicRecord> musicPlayerMusicRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 20.0, 12.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.network(
                                  'https://cdn.dribbble.com/users/1237300/screenshots/6478927/__-1_1_____.gif',
                                  width: 280.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget.name,
                                      'name',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF393B3F),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 350.0,
                          child: custom_widgets.AdvanceMusicPlayer(
                            width: double.infinity,
                            height: 350.0,
                            initialUrl: widget.url!,
                            sliderActiveColor:
                                FlutterFlowTheme.of(context).secondary,
                            sliderInactiveColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backwardIconPath: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            forwardIconPath: Icon(
                              Icons.navigate_next,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            backwardIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            forwardIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            pauseIconPath: Icon(
                              Icons.pause_circle_outline,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            playIconPath: Icon(
                              Icons.play_circle_outlined,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            pauseIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            playIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            loopIconPath: Icon(
                              Icons.loop,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            loopIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            shuffleIconPath: Icon(
                              Icons.shuffle,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            shuffleIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            playbackDurationTextColor:
                                FlutterFlowTheme.of(context).secondary,
                            previousIconPath: Icon(
                              Icons.skip_previous,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            nextIconPath: Icon(
                              Icons.skip_next,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            previousIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            nextIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            loopIconPressedPath: Icon(
                              Icons.loop,
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                            shuffleIconPressedPath: Icon(
                              Icons.shuffle,
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                            speakerOnIconPath: Icon(
                              Icons.speaker,
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                            speakerOffIconPath: Icon(
                              Icons.speaker,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            speakerOnIconColor:
                                FlutterFlowTheme.of(context).secondary,
                            speakerOffIconColor:
                                FlutterFlowTheme.of(context).alternate,
                            dropdownTextColor:
                                FlutterFlowTheme.of(context).secondary,
                            timerIcon: Icon(
                              Icons.timer_sharp,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            musicUrls: musicPlayerMusicRecordList
                                .map((e) => e.url)
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
