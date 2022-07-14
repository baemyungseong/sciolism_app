//import constaint
import 'package:sciolism_app/constants/colors.dart';
import 'package:sciolism_app/constants/images.dart';

//import route
import 'package:sciolism_app/screens/route/route.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';

// --------

class authenticationWrapper extends StatefulWidget {
  const authenticationWrapper({Key? key}) : super(key: key);

  @override
  _authenticationWrapperState createState() => _authenticationWrapperState();
}

class _authenticationWrapperState extends State<authenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: transparent),
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(authenticationWrapperBackground),
                  fit: BoxFit.cover),
            ),
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    child: GestureDetector(
                  //action navigate to sign in screen
                  onTap: () {
                    Navigator.of(context).push(createRoute("signIn"));
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 42,
                      width: 345,
                      decoration: BoxDecoration(
                        color: black1,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                            color: white2,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )),
                )),
                SizedBox(height: 16),
                Container(
                    child: GestureDetector(
                  //action navigate to sign up screen
                  onTap: () {
                    Navigator.of(context).push(createRoute("signUp"));
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 42,
                      width: 345,
                      decoration: BoxDecoration(
                        color: white2,
                        border: Border.all(width: 1, color: black1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Đăng ký",
                        style: TextStyle(
                            color: black1,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )),
                )),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 4,
                        thickness: 0.5,
                        indent: 29,
                        endIndent: 16,
                        color: grey1,
                      ),
                    ),
                    Text(
                      'Hoặc tiếp tục với',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        // height: 1.4,
                        letterSpacing: 0.2,
                        fontSize: 12,
                        color: grey1,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Divider(
                        height: 4,
                        thickness: 0.5,
                        indent: 16,
                        endIndent: 29,
                        color: grey1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }
}
