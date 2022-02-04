import '../court_details/court_details_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FindCourtCopyWidget extends StatefulWidget {
  const FindCourtCopyWidget({Key key}) : super(key: key);

  @override
  _FindCourtCopyWidgetState createState() => _FindCourtCopyWidgetState();
}

class _FindCourtCopyWidgetState extends State<FindCourtCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.darkBG,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourtDetailsWidget(),
              ),
            );
          },
        ),
        title: Text(
          'Crazy Dribble Workout',
          style: FlutterFlowTheme.title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.75, -0.92),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
                    child: Text(
                      'Find a Drill',
                      style: FlutterFlowTheme.title2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, -0.8),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x34000000),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: FlutterFlowTheme.grayLines,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, -0.3),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 0),
                                  child: TextFormField(
                                    onFieldSubmitted: (_) async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      setState(
                                          () => algoliaSearchResults1 = null);
                                      await CourtsRecord.search(
                                        term: valueOrDefault<String>(
                                          courtSearchFieldController.text,
                                          '*',
                                        ),
                                        location: getCurrentUserLocation(
                                            defaultLocation: LatLng(
                                                37.4298229, -122.1735655)),
                                      )
                                          .then(
                                              (r) => algoliaSearchResults1 = r)
                                          .onError((_, __) =>
                                              algoliaSearchResults1 = [])
                                          .whenComplete(() => setState(() {}));
                                    },
                                    controller: courtSearchFieldController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Search for drills...',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.subtitle2.override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.iconGray,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 20, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.search_outlined,
                              color: FlutterFlowTheme.primaryColor,
                              size: 30,
                            ),
                            onPressed: () async {
                              setState(() => algoliaSearchResults2 = null);
                              await CourtsRecord.search(
                                term: courtSearchFieldController.text,
                              )
                                  .then((r) => algoliaSearchResults2 = r)
                                  .onError(
                                      (_, __) => algoliaSearchResults2 = [])
                                  .whenComplete(() => setState(() {}));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          child: FlutterFlowVideoPlayer(
                            path: 'assets/videos/20141202_183936.mp4',
                            videoType: VideoType.asset,
                            autoPlay: false,
                            looping: true,
                            showControls: true,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          child: FlutterFlowVideoPlayer(
                            path: 'assets/videos/20141206_175839.mp4',
                            videoType: VideoType.asset,
                            autoPlay: false,
                            looping: true,
                            showControls: true,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          child: FlutterFlowVideoPlayer(
                            path: 'assets/videos/20141214_112917.mp4',
                            videoType: VideoType.asset,
                            autoPlay: false,
                            looping: true,
                            showControls: true,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
