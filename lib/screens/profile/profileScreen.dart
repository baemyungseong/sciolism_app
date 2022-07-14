import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sciolism_app/api/firebase_api.dart';

//import constants
import 'package:sciolism_app/constants/colors.dart';

//import others
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import Firebase stuffs
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sciolism_app/constants/images.dart';
import 'package:sciolism_app/models/userModel.dart';
import 'package:sciolism_app/screens/profile/changingPassword.dart';

class profileManagementScreen extends StatefulWidget {
  String uid;
  profileManagementScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _profileManagementScreenState createState() =>
      _profileManagementScreenState();
}

class _profileManagementScreenState extends State<profileManagementScreen> {
  String uid = '';
  late userModel currentUser = userModel(
      id: '',
      email: '',
      fullName: '',
      userName: '',
      phoneNumber: '',
      background: '',
      avatar: '',
      state: '',
      scoreList: [],
      token: '');
  Future getUserDetail() async {
    FirebaseFirestore.instance
        .collection("users")
        .where("userId", isEqualTo: uid)
        .snapshots()
        .listen((value) {
      setState(() {
        currentUser = userModel.fromDocument(value.docs.first.data());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    print('The current uid is $uid');
    getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent),
        child: Scaffold(
          body: Container(
              // width: MediaQuery. of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(signInBackground), fit: BoxFit.cover),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Column(
                          children: [
                            Text(
                              'Personal details',
                              style: TextStyle(
                                fontFamily: 'SFProText',
                                fontSize: 24,
                                color: black1,
                                fontWeight: FontWeight.w700,
                                height: 1.6,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 24),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: white1),
                        ),
                        Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 8, left: 24 + 18, right: 24),
                                  child: Container(
                                    width: 48 + 8 + 8,
                                    height: 48 + 8 + 8,
                                    decoration: new BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                // userList[index]
                                                //     .avatar
                                                'https://i.imgur.com/bCnExb4.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                  ),
                                ),
                                Container(
                                    padding:
                                        EdgeInsets.only(top: 4, right: 24 + 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 180,
                                          child: Text(
                                            currentUser.userName,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: black1,
                                                fontFamily: 'SFProText',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        SizedBox(
                                          child: new Center(
                                            child: new Container(
                                              margin: new EdgeInsetsDirectional
                                                  .only(start: 1.0, end: 1.0),
                                              height: 0.8,
                                              width: 150,
                                              color: black1,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          width: 180,
                                          child: Text(
                                            currentUser.email,
                                            style: TextStyle(
                                                color: black1,
                                                fontFamily: 'SFProText',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          currentUser.phoneNumber,
                                          style: TextStyle(
                                              color: black1,
                                              fontFamily: 'SFProText',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ))
                              ],
                            ))
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              //action navigate to dashboard screen
                              // onTap: () {
                              //   Navigator.push(context, MaterialPageRoute(builder: (context) => profileDetailScreen()))
                              //   .then((value) => setState(() {
                              //   }));
                              // },
                              child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  height: 50,
                                  width: 319,
                                  decoration: BoxDecoration(
                                    color: white1,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: black1.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 24),
                                      Text(
                                        "Profile",
                                        style: TextStyle(
                                            color: black1,
                                            fontFamily: 'SFProText',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      new Spacer(),
                                      Container(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                          child: Icon(Iconsax.arrow_right,
                                              size: 24, color: black1)),
                                      SizedBox(width: 12)
                                    ],
                                  )),
                            )),
                        SizedBox(height: 20),
                        Container(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              //action navigate to dashboard screen
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         changingPasswordScreen(uid: currentUser.id,),
                                //   ),
                                // );
                              },
                              child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  height: 50,
                                  width: 319,
                                  decoration: BoxDecoration(
                                    color: white1,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: black1.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 24),
                                      Text(
                                        "Change Password",
                                        style: TextStyle(
                                            color: black1,
                                            fontFamily: 'SFProText',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      new Spacer(),
                                      Container(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                          child: Icon(Iconsax.arrow_right,
                                              size: 24, color: black1)),
                                      SizedBox(width: 12)
                                    ],
                                  )),
                            )),
                        SizedBox(height: 20),
                        Container(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              //action navigate to dashboard screen
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           conditionScreen(),
                              //     ),
                              //   );
                              // },
                              child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  height: 50,
                                  width: 319,
                                  decoration: BoxDecoration(
                                    color: white1,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: black1.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 24),
                                      Text(
                                        "Terms & Privacy Policy",
                                        style: TextStyle(
                                            color: black1,
                                            fontFamily: 'SFProText',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      new Spacer(),
                                      Container(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                          child: Icon(Iconsax.arrow_right,
                                              size: 24, color: black1)),
                                      SizedBox(width: 12)
                                    ],
                                  )),
                            )),
                        SizedBox(height: 20),
                        Container(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              //action navigate to dashboard screen
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         helpCenterScreen(),
                                //   ),
                                // );
                              },
                              child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  height: 50,
                                  width: 319,
                                  decoration: BoxDecoration(
                                    color: white1,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: black1.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 24),
                                      Text(
                                        "Help",
                                        style: TextStyle(
                                            color: black1,
                                            fontFamily: 'SFProText',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      new Spacer(),
                                      Container(
                                          padding: EdgeInsets.zero,
                                          alignment: Alignment.center,
                                          child: Icon(Iconsax.arrow_right,
                                              size: 24, color: black1)),
                                      SizedBox(width: 12)
                                    ],
                                  )),
                            )),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          //action navigate to dashboard screen
                          onTap: () => signOut(context),
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 300),
                            height: 48,
                            width: 200,
                            decoration: BoxDecoration(
                              color: black1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: black1.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 4), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: black1.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 64,
                                  offset: Offset(
                                      15, 15), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                  color: white1,
                                  fontFamily: 'SFProText',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        )),
                  ])),
        ));
  }
}
