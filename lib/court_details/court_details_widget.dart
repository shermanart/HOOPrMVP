import '../backend/backend.dart';
import '../components/rate_court_widget.dart';
import '../find_court_copy/find_court_copy_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CourtDetailsWidget extends StatefulWidget {
  const CourtDetailsWidget({
    Key key,
    this.court,
  }) : super(key: key);

  final CourtsRecord court;

  @override
  _CourtDetailsWidgetState createState() => _CourtDetailsWidgetState();
}

class _CourtDetailsWidgetState extends State<CourtDetailsWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CommentsRecord>>(
      stream: queryCommentsRecord(
        queryBuilder: (commentsRecord) =>
            commentsRecord.where('court', isEqualTo: widget.court.reference),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitFadingCircle(
                color: FlutterFlowTheme.primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<CommentsRecord> courtDetailsCommentsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.white,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 320,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.background,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: Image.asset(
                                  'assets/images/classHero.jpg',
                                ).image,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 44, 0, 0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xB2111417),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 46,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: FlutterFlowTheme.white,
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(
                                                initialPage: 'nearbyCourts'),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Falcons',
                                  style: FlutterFlowTheme.title2,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Overall',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 4, 0),
                                          child: Text(
                                            '7.9',
                                            style: FlutterFlowTheme.title3,
                                          ),
                                        ),
                                        Icon(
                                          Icons.sports_basketball_outlined,
                                          color: FlutterFlowTheme.primaryColor,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'A 7-man basketball team based in San Diego, CA. Looking for a new assistant coach.',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.96,
                          height: 200,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final comments =
                                  courtDetailsCommentsRecordList?.toList() ??
                                      [];
                              if (comments.isEmpty) {
                                return Image.asset(
                                  'assets/images/emptyReviews@3x.png',
                                );
                              }
                              return Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height * 1,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: PageView.builder(
                                        controller: pageViewController ??=
                                            PageController(
                                                initialPage: min(
                                                    0, comments.length - 1)),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: comments.length,
                                        itemBuilder: (context, commentsIndex) {
                                          final commentsItem =
                                              comments[commentsIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  commentsItem.user),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color: FlutterFlowTheme
                                                            .primaryColor,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final ratingUsersRecord =
                                                    snapshot.data;
                                                return Container(
                                                  width: 100,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        FlutterFlowTheme.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3,
                                                        color:
                                                            Color(0x2E000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                          .grayLines,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    12, 12, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          8,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 40,
                                                                    height: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .person,
                                                                      color: FlutterFlowTheme
                                                                          .grayDark,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    ratingUsersRecord
                                                                        .displayName,
                                                                    'Guest',
                                                                  ),
                                                                  style: FlutterFlowTheme
                                                                      .subtitle2,
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text(
                                                                  'Overall',
                                                                  style: FlutterFlowTheme
                                                                      .bodyText1,
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        commentsItem
                                                                            .courtQualityRating
                                                                            .toString(),
                                                                        style: FlutterFlowTheme
                                                                            .title3,
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .sports_basketball_outlined,
                                                                      color: FlutterFlowTheme
                                                                          .primaryColor,
                                                                      size: 20,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    12, 8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  AutoSizeText(
                                                                commentsItem
                                                                    .text,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: SmoothPageIndicator(
                                        controller: pageViewController ??=
                                            PageController(
                                                initialPage: min(
                                                    0, comments.length - 1)),
                                        count: comments.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) {
                                          pageViewController.animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: ExpandingDotsEffect(
                                          expansionFactor: 2,
                                          spacing: 8,
                                          radius: 16,
                                          dotWidth: 16,
                                          dotHeight: 4,
                                          dotColor: FlutterFlowTheme.grayLines,
                                          activeDotColor:
                                              FlutterFlowTheme.grayDark,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Team Drills',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.title2,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: GridView(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                  path:
                                      'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                  videoType: VideoType.network,
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
                                  path:
                                      'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                  videoType: VideoType.network,
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
                                  path:
                                      'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                  videoType: VideoType.network,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Team Workouts',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.title2,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FindCourtCopyWidget(),
                                    ),
                                  );
                                },
                                child: Slidable(
                                  actionPane: const SlidableScrollActionPane(),
                                  secondaryActions: [
                                    IconSlideAction(
                                      caption: 'Save',
                                      color: FlutterFlowTheme.tertiaryColor,
                                      icon: Icons.save,
                                      onTap: () {
                                        print(
                                            'SlidableActionWidget pressed ...');
                                      },
                                    ),
                                  ],
                                  child: ListTile(
                                    title: Text(
                                      'Crazy Dribble Workout',
                                      style: FlutterFlowTheme.title3,
                                    ),
                                    subtitle: Text(
                                      'For those that want crazy dribbling skills',
                                      style: FlutterFlowTheme.subtitle2,
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF303030),
                                      size: 20,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    dense: false,
                                  ),
                                ),
                              ),
                              Slidable(
                                actionPane: const SlidableScrollActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: 'Share',
                                    color: Colors.blue,
                                    icon: Icons.share,
                                    onTap: () {
                                      print('SlidableActionWidget pressed ...');
                                    },
                                  ),
                                ],
                                child: ListTile(
                                  title: Text(
                                    'Sniper Shooter',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  subtitle: Text(
                                    'For developing consistent shooting ability',
                                    style: FlutterFlowTheme.subtitle2,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
                                ),
                              ),
                              Slidable(
                                actionPane: const SlidableScrollActionPane(),
                                secondaryActions: [
                                  IconSlideAction(
                                    caption: 'Share',
                                    color: Colors.blue,
                                    icon: Icons.share,
                                    onTap: () {
                                      print('SlidableActionWidget pressed ...');
                                    },
                                  ),
                                ],
                                child: ListTile(
                                  title: Text(
                                    'Lockdown Defender Training',
                                    style: FlutterFlowTheme.title3,
                                  ),
                                  subtitle: Text(
                                    'For developing game-winning defensive skills',
                                    style: FlutterFlowTheme.subtitle2,
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFF303030),
                                    size: 20,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  dense: false,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x29000000),
                          offset: Offset(0, -1),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height: 584,
                                    child: RateCourtWidget(
                                      court: widget.court,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          text: 'Rate Team',
                          icon: Icon(
                            Icons.star_rate_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: FlutterFlowTheme.secondaryColor,
                            textStyle: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.white,
                              fontWeight: FontWeight.bold,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await launchURL(
                                functions.getMapUrl(widget.court.location));
                          },
                          text: 'Join Team',
                          icon: Icon(
                            Icons.sports_basketball,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.white,
                              fontWeight: FontWeight.bold,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
