import '../backend/backend.dart';
import '../court_details/court_details_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NearbyCourtsWidget extends StatefulWidget {
  const NearbyCourtsWidget({
    Key key,
    this.searchTerm,
  }) : super(key: key);

  final String searchTerm;

  @override
  _NearbyCourtsWidgetState createState() => _NearbyCourtsWidgetState();
}

class _NearbyCourtsWidgetState extends State<NearbyCourtsWidget> {
  LatLng currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return FutureBuilder<List<CourtsRecord>>(
      future: CourtsRecord.search(
        term: '*',
        location: getCurrentUserLocation(
            defaultLocation: LatLng(37.4298229, -122.1735655)),
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
        List<CourtsRecord> nearbyCourtsCourtsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.75, -0.92),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 8),
                      child: Text(
                        'Teams',
                        style: FlutterFlowTheme.title2,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                        child: Text(
                          'December 19, 2020',
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF8B97A2),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourtDetailsWidget(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.1, -0.5),
                                      child: Text(
                                        'Falcons',
                                        style:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF15212B),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(2.64, 0.55),
                                      child: Text(
                                        'San Diego, CA',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF8B97A2),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/913/400',
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: AlignmentDirectional(0.05, 0),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Color(0xFF95A1AC),
                                    size: 28,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Warthogs',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'St. Louis, MO',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Vipers',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'Phoenix, AZ',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Dons',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'Los Angeles, CA',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Warthogs',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'St. Louis, MO',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Vipers',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'Phoenix, AZ',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Dons',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'Los Angeles, CA',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Spartans',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'Los Angeles, CA',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Lightning',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'Los Angeles, CA',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'St. Mary\'s',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'Los Angeles, CA',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.1, -0.5),
                                    child: Text(
                                      'Cowboys',
                                      style:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF15212B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(2.64, 0.55),
                                    child: Text(
                                      'Los Angeles, CA',
                                      style:
                                          FlutterFlowTheme.bodyText2.override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/913/400',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF95A1AC),
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
