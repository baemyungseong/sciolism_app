//import constaint
import 'package:sciolism_app/constants/colors.dart';
import 'package:sciolism_app/constants/images.dart';
import 'package:sciolism_app/screens/authentication/verificationOTPCode.dart';

//import route
import 'package:sciolism_app/screens/route/route.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';

// --------

class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _forgotPasswordScreenState createState() => _forgotPasswordScreenState();
}

class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: transparent),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(authenticationGeneralBackground),
                  fit: BoxFit.cover),
            ),
            padding: EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(0.0),
                      child: Icon(
                        Iconsax.arrow_left,
                        size: 24,
                        color: black1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.zero,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Quên mật khẩu',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                // height: 1.4,
                                letterSpacing: 0.2,
                                fontSize: 32,
                                color: black1,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 8),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: black1,
                                shape: BoxShape.circle,
                              ),
                            )
                          ],
                        )),
                    SizedBox(height: 16),
                    Container(
                        width: 393 - 48,
                        child: Text(
                          'Để có thể lấy lại mật khẩu, hãy nhập tài khoản Email, chúng tôi sẽ gửi cho bạn 1 mã xác thực!',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              height: 1.6,
                              letterSpacing: 0.2,
                              fontSize: 14,
                              color: grey1,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
                SizedBox(height: 40 + 8),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(handSecurity, scale: 4),
                ),
                SizedBox(height: 40 + 8),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tài khoản Email',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          height: 1.4,
                          letterSpacing: 0.2,
                          fontSize: 14,
                          color: black1,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8 + 4),
                      Form(
                        key: emailFormKey,
                        child: Container(
                          width: 345,
                          height: 42,
                          decoration: BoxDecoration(
                            color: white2.withOpacity(0.64),
                            border: Border.all(
                                width: 0.5, color: grey1.withOpacity(0.32)),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: black1.withOpacity(0.08),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset:
                                    Offset(4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: [AutofillHints.email],
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                // height: 1.4,
                                letterSpacing: 0.2,
                                fontSize: 12,
                                color: black1,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 16, right: 16),
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  // height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 12,
                                  color: grey1.withOpacity(0.64),
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: "your_email@gmail.com",
                                filled: true,
                                fillColor: white2.withOpacity(0.64),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: black1, width: 0.5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.transparent,
                                  fontSize: 0,
                                  height: 0,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Container(
                    child: GestureDetector(
                  //action navigate to sign in screen
                  onTap: () {
                    Navigator.of(context).push(createRoute("verification"));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => verificationOTPCode(
                                  email: emailController.text,
                                )));
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
                        "Lấy lại mật khẩu",
                        style: TextStyle(
                            color: white2,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )),
                )),
                SizedBox(height: 40),
                Container(
                    child: GestureDetector(
                  //action navigate to instruction manual screen
                  onTap: () {
                    Navigator.of(context).push(createRoute("instruction"));
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        "Cần trợ giúp?",
                        style: TextStyle(
                            color: black1,
                            fontFamily: 'Roboto',
                            // height: 1.4,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                )),
              ],
            ),
          ),
        ));
  }
}
