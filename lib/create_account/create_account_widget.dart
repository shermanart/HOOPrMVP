import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../login/login_widget.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  DateTime datePicked;
  String uploadedFileUrl = '';
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController displayNameInputController;
  TextEditingController emailInputController;
  String stateInputValue;
  TextEditingController cityInputController;
  TextEditingController passwordInputController;
  bool passwordInputVisibility;
  TextEditingController confirmPasswordInputController;
  bool confirmPasswordInputVisibility;
  TextEditingController bioInputController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bioInputController = TextEditingController();
    cityInputController = TextEditingController();
    displayNameInputController = TextEditingController();
    firstNameInputController = TextEditingController();
    lastNameInputController = TextEditingController();
    emailInputController = TextEditingController();
    passwordInputController = TextEditingController();
    passwordInputVisibility = false;
    confirmPasswordInputController = TextEditingController();
    confirmPasswordInputVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Register',
                        style: FlutterFlowTheme.title1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 70, 0),
                          child: Text(
                            'Create an account below, by entering your information.',
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            uploadedFileUrl,
                            'http://www.gravatar.com/avatar/?d=mp',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            validateFileFormat(
                                selectedMedia.storagePath, context)) {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          final downloadUrl = await uploadData(
                              selectedMedia.storagePath, selectedMedia.bytes);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (downloadUrl != null) {
                            setState(() => uploadedFileUrl = downloadUrl);
                            showUploadMessage(
                              context,
                              'Success!',
                            );
                          } else {
                            showUploadMessage(
                              context,
                              'Failed to upload media',
                            );
                            return;
                          }
                        }
                      },
                      text: 'Upload Photo',
                      icon: Icon(
                        Icons.upload_sharp,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 40,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Overpass',
                          color: Colors.white,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                          child: TextFormField(
                            controller: firstNameInputController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              hintText: 'Enter your first name...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.primaryColor,
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                          child: TextFormField(
                            controller: lastNameInputController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              hintText: 'Enter your last name...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.primaryColor,
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                          child: TextFormField(
                            controller: displayNameInputController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              hintText: 'Enter your username...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked = date);
                            },
                            currentTime: getCurrentTimestamp,
                          );
                        },
                        text: 'Add Date Of Birth',
                        icon: Icon(
                          Icons.calendar_today_rounded,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Overpass',
                            color: Colors.white,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                          child: TextFormField(
                            controller: emailInputController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              hintText: 'Enter your email address...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.primaryColor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter your email';
                              }
                                  final usersCreateData = createUsersRecordData(
                                    email: emailInputController.text,
                                    displayName:
                                        displayNameInputController.text,
                                    photoUrl: uploadedFileUrl,
                                    uid: '',
                                    createdTime: getCurrentTimestamp,
                                    firstName: firstNameInputController.text,
                                    lastName: lastNameInputController.text,
                                    dob: datePicked,
                                    city: cityInputController.text,
                                    state: stateInputValue,
                                    bio: bioInputController.text,
                                  );
                                  await UsersRecord.collection
                                      .doc(user.uid)
                                      .update(usersCreateData);

                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavBarPage(
                                          initialPage: 'nearbyCourts'),
                                    ),
                                    (r) => false,
                                  );
                                },
                                text: 'Create Account',
                                options: FFButtonOptions(
                                  width: 170,
                                  height: 50,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Overpass',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                        child: FlutterFlowDropDown(
                          options: ['CA', 'TX', 'UT', 'LA'].toList(),
                          onChanged: (val) =>
                              setState(() => stateInputValue = val),
                          width: 130,
                          height: 40,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Overpass',
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Color(0xFFDBE2E7),
                          borderWidth: 2,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          hidesUnderline: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: TextFormField(
                          controller: passwordInputController,
                          obscureText: !passwordInputVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.secondaryColor,
                            ),
                            hintText: 'Enter Password',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.secondaryColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordInputVisibility =
                                    !passwordInputVisibility,
                              ),
                              child: Icon(
                                passwordInputVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: FlutterFlowTheme.secondaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Overpass',
                            color: Color(0xFF14181B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: TextFormField(
                          controller: confirmPasswordInputController,
                          obscureText: !confirmPasswordInputVisibility,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.secondaryColor,
                            ),
                            hintText: 'Enter Password',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.secondaryColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => confirmPasswordInputVisibility =
                                    !confirmPasswordInputVisibility,
                              ),
                              child: Icon(
                                confirmPasswordInputVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: FlutterFlowTheme.secondaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Overpass',
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                          child: TextFormField(
                            controller: bioInputController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Bio',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              hintText: 'Tell us a little about yourself...',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Overpass',
                              color: FlutterFlowTheme.primaryColor,
                            ),
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              if (!formKey.currentState.validate()) {
                                return;
                              }
                              if (passwordInputController.text !=
                                  confirmPasswordInputController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Passwords don\'t match!',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final user = await createAccountWithEmail(
                                context,
                                emailInputController.text,
                                passwordInputController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              final usersCreateData = createUsersRecordData(
                                email: emailInputController.text,
                                displayName: displayNameInputController.text,
                                photoUrl: uploadedFileUrl,
                                uid: '',
                                createdTime: getCurrentTimestamp,
                                firstName: firstNameInputController.text,
                                lastName: lastNameInputController.text,
                                dob: datePicked,
                                city: cityInputController.text,
                                state: stateInputValue,
                                bio: bioInputController.text,
                              );
                              await UsersRecord.collection
                                  .doc(user.uid)
                                  .update(usersCreateData);

                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'nearbyCourts'),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Create Account',
                            options: FFButtonOptions(
                              width: 230,
                              height: 50,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Overpass',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 250),
                                    reverseDuration:
                                        Duration(milliseconds: 250),
                                    child: LoginWidget(),
                                  ),
                                );
                              },
                              text: 'Back to Login',
                              options: FFButtonOptions(
                                width: 170,
                                height: 40,
                                color: FlutterFlowTheme.white,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.primaryColor,
                                ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
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
