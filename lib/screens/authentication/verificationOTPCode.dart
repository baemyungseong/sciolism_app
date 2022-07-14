//import constaint
import 'package:email_auth/email_auth.dart';
import 'package:sciolism_app/api/firebase_api.dart';
import 'package:sciolism_app/constants/colors.dart';
import 'package:sciolism_app/constants/images.dart';

//import route
import 'package:sciolism_app/screens/route/route.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';
import 'package:sciolism_app/screens/widgets/snackBarWidget.dart';

// --------

class verificationOTPCode extends StatefulWidget {
  String email;
  verificationOTPCode({Key? key, required this.email}) : super(key: key);

  @override
  _verificationOTPCodeState createState() => _verificationOTPCodeState(email);
}

class _verificationOTPCodeState extends State<verificationOTPCode> {
  String email = '';
  _verificationOTPCodeState(email);
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;
  TextEditingController OTPCodeController = TextEditingController();
  final GlobalKey<FormState> OTPCodeFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> confirmPasswordFormKey = GlobalKey<FormState>();

  late EmailAuth emailAuth;
  bool submitValid = false;

  void sendOtpEmail() async {
    bool result =
        await emailAuth.sendOtp(recipientMail: widget.email, otpLength: 4);
    if (result) {
      setState(() {
        submitValid = true;
      });
    } else {
      showSnackBar(context, 'Please check your email address', 'error');
    }
  }

  @override
  void initState() {
    emailAuth = new EmailAuth(
      sessionName: "Sciolism Application",
    );
    super.initState();
  }

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
            padding: EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 32),
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
                              'Xác thực',
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
                          'Chúng tôi đã gửi mã xác thực đến tài khoản Email này, hãy kiểm tra và nhập mã để xác thực!',
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
                SizedBox(height: 24),
                Container(
                    child: GestureDetector(
                  //action navigate to change email screen
                  onTap: () {
                    print("luc lam thi xoa dong nay nha bà Nhất!");
                    // Navigator.of(context).pop();
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 40,
                      width: 345,
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
                            offset: Offset(4, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 290,
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              widget.email,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: black1,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                          Spacer(),
                          Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child:
                                  Icon(Iconsax.repeat, size: 20, color: black1))
                        ],
                      )),
                )),
                SizedBox(height: 32),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Mã xác thực OTP",
                      style: TextStyle(
                          color: black1,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    SizedBox(height: 16 + 8),
                    Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 40,
                            width: 40,
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
                                  offset: Offset(
                                      4, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: TextFormField(
                                onSaved: (pin1) {},
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                autofillHints: [AutofillHints.oneTimeCode],
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 16,
                                  color: black1,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    height: 1.4,
                                    letterSpacing: 0.2,
                                    fontSize: 16,
                                    color: grey1.withOpacity(0.64),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: "0",
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 40,
                            width: 40,
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
                                  offset: Offset(
                                      4, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: TextFormField(
                                onSaved: (pin2) {},
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                autofillHints: [AutofillHints.oneTimeCode],
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 16,
                                  color: black1,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    height: 1.4,
                                    letterSpacing: 0.2,
                                    fontSize: 16,
                                    color: grey1.withOpacity(0.64),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: "0",
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 40,
                            width: 40,
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
                                  offset: Offset(
                                      4, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: TextFormField(
                                onSaved: (pin3) {},
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                autofillHints: [AutofillHints.oneTimeCode],
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 16,
                                  color: black1,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    height: 1.4,
                                    letterSpacing: 0.2,
                                    fontSize: 16,
                                    color: grey1.withOpacity(0.64),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: "0",
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 40,
                            width: 40,
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
                                  offset: Offset(
                                      4, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: TextFormField(
                                onSaved: (pin4) {},
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                autofillHints: [AutofillHints.oneTimeCode],
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 16,
                                  color: black1,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    height: 1.4,
                                    letterSpacing: 0.2,
                                    fontSize: 16,
                                    color: grey1.withOpacity(0.64),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: "0",
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 40,
                            width: 40,
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
                                  offset: Offset(
                                      4, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: TextFormField(
                                onSaved: (pin5) {},
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                autofillHints: [AutofillHints.oneTimeCode],
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 16,
                                  color: black1,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    height: 1.4,
                                    letterSpacing: 0.2,
                                    fontSize: 16,
                                    color: grey1.withOpacity(0.64),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: "0",
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
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 40,
                            width: 40,
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
                                  offset: Offset(
                                      4, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: TextFormField(
                                onSaved: (pin6) {},
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                autofillHints: [AutofillHints.oneTimeCode],
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 16,
                                  color: black1,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    height: 1.4,
                                    letterSpacing: 0.2,
                                    fontSize: 16,
                                    color: grey1.withOpacity(0.64),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText: "0",
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
                        ],
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 32),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Mật khẩu mới',
                //       style: TextStyle(
                //         fontFamily: 'Roboto',
                //         height: 1.4,
                //         letterSpacing: 0.2,
                //         fontSize: 14,
                //         color: black1,
                //         fontWeight: FontWeight.w500,
                //       ),
                //       textAlign: TextAlign.left,
                //     ),
                //     SizedBox(height: 8 + 4),
                //     Form(
                //       key: passwordFormKey,
                //       child: Container(
                //         width: 345,
                //         height: 42,
                //         decoration: BoxDecoration(
                //           color: white2.withOpacity(0.64),
                //           border: Border.all(
                //               width: 0.5, color: grey1.withOpacity(0.32)),
                //           borderRadius: BorderRadius.circular(4),
                //           boxShadow: [
                //             BoxShadow(
                //               color: black1.withOpacity(0.08),
                //               spreadRadius: 0,
                //               blurRadius: 8,
                //               offset:
                //                   Offset(4, 4), // changes position of shadow
                //             ),
                //           ],
                //         ),
                //         alignment: Alignment.topCenter,
                //         child: TextFormField(
                //             controller: passwordController,
                //             obscureText: isHiddenPassword,
                //             keyboardType: TextInputType.visiblePassword,
                //             autofillHints: [AutofillHints.password],
                //             style: TextStyle(
                //               fontFamily: 'Roboto',
                //               // height: 1.4,
                //               letterSpacing: 0.2,
                //               fontSize: 12,
                //               color: black1,
                //               fontWeight: FontWeight.w400,
                //             ),
                //             decoration: InputDecoration(
                //               suffixIcon: InkWell(
                //                   onTap: _togglePasswordView,
                //                   child: isHiddenPassword
                //                       ? Stack(
                //                           alignment: Alignment.center,
                //                           children: [
                //                               Container(
                //                                   padding: EdgeInsets.only(
                //                                       left: 16, right: 16),
                //                                   child: Icon(Iconsax.eye,
                //                                       size: 20, color: black1))
                //                             ])
                //                       : Stack(
                //                           alignment: Alignment.center,
                //                           children: [
                //                               Container(
                //                                   padding: EdgeInsets.only(
                //                                       left: 16, right: 16),
                //                                   child: Icon(Iconsax.eye_slash,
                //                                       size: 20,
                //                                       color: grey1
                //                                           .withOpacity(0.64)))
                //                             ])),
                //               contentPadding:
                //                   EdgeInsets.only(left: 16, right: 0),
                //               hintStyle: TextStyle(
                //                 fontFamily: 'Roboto',
                //                 // height: 1.4,
                //                 letterSpacing: 0.2,
                //                 fontSize: 12,
                //                 color: grey1.withOpacity(0.64),
                //                 fontWeight: FontWeight.w400,
                //               ),
                //               hintText: "Nhập mật khẩu của bạn",
                //               filled: true,
                //               fillColor: white2.withOpacity(0.64),
                //               focusedBorder: OutlineInputBorder(
                //                 borderSide:
                //                     const BorderSide(color: black1, width: 0.5),
                //                 borderRadius: BorderRadius.circular(4),
                //               ),
                //               border: OutlineInputBorder(
                //                 borderSide: BorderSide.none,
                //                 borderRadius: BorderRadius.circular(4.0),
                //               ),
                //               errorStyle: TextStyle(
                //                 color: Colors.transparent,
                //                 fontSize: 0,
                //                 height: 0,
                //               ),
                //             )),
                //       ),
                //     ),
                //     SizedBox(height: 28),
                //     Text(
                //       'Xác nhận mật khẩu mới',
                //       style: TextStyle(
                //         fontFamily: 'Roboto',
                //         height: 1.4,
                //         letterSpacing: 0.2,
                //         fontSize: 14,
                //         color: black1,
                //         fontWeight: FontWeight.w500,
                //       ),
                //       textAlign: TextAlign.left,
                //     ),
                //     SizedBox(height: 8 + 4),
                //     Form(
                //       key: confirmPasswordFormKey,
                //       child: Container(
                //         width: 345,
                //         height: 42,
                //         decoration: BoxDecoration(
                //           color: white2.withOpacity(0.64),
                //           border: Border.all(
                //               width: 0.5, color: grey1.withOpacity(0.32)),
                //           borderRadius: BorderRadius.circular(4),
                //           boxShadow: [
                //             BoxShadow(
                //               color: black1.withOpacity(0.08),
                //               spreadRadius: 0,
                //               blurRadius: 8,
                //               offset:
                //                   Offset(4, 4), // changes position of shadow
                //             ),
                //           ],
                //         ),
                //         alignment: Alignment.topCenter,
                //         child: TextFormField(
                //             controller: confirmPasswordController,
                //             obscureText: isHiddenConfirmPassword,
                //             keyboardType: TextInputType.visiblePassword,
                //             autofillHints: [AutofillHints.password],
                //             style: TextStyle(
                //               fontFamily: 'Roboto',
                //               // height: 1.4,
                //               letterSpacing: 0.2,
                //               fontSize: 12,
                //               color: black1,
                //               fontWeight: FontWeight.w400,
                //             ),
                //             decoration: InputDecoration(
                //               suffixIcon: InkWell(
                //                   onTap: _toggleConfirmPasswordView,
                //                   child: isHiddenConfirmPassword
                //                       ? Stack(
                //                           alignment: Alignment.center,
                //                           children: [
                //                               Container(
                //                                   padding: EdgeInsets.only(
                //                                       left: 16, right: 16),
                //                                   child: Icon(Iconsax.eye,
                //                                       size: 20, color: black1))
                //                             ])
                //                       : Stack(
                //                           alignment: Alignment.center,
                //                           children: [
                //                               Container(
                //                                   padding: EdgeInsets.only(
                //                                       left: 16, right: 16),
                //                                   child: Icon(Iconsax.eye_slash,
                //                                       size: 20,
                //                                       color: grey1
                //                                           .withOpacity(0.64)))
                //                             ])),
                //               contentPadding:
                //                   EdgeInsets.only(left: 16, right: 0),
                //               hintStyle: TextStyle(
                //                 fontFamily: 'Roboto',
                //                 // height: 1.4,
                //                 letterSpacing: 0.2,
                //                 fontSize: 12,
                //                 color: grey1.withOpacity(0.64),
                //                 fontWeight: FontWeight.w400,
                //               ),
                //               hintText: "Xác nhận lại mật khẩu của bạn",
                //               filled: true,
                //               fillColor: white2.withOpacity(0.64),
                //               focusedBorder: OutlineInputBorder(
                //                 borderSide:
                //                     const BorderSide(color: black1, width: 0.5),
                //                 borderRadius: BorderRadius.circular(4),
                //               ),
                //               border: OutlineInputBorder(
                //                 borderSide: BorderSide.none,
                //                 borderRadius: BorderRadius.circular(4.0),
                //               ),
                //               errorStyle: TextStyle(
                //                 color: Colors.transparent,
                //                 fontSize: 0,
                //                 height: 0,
                //               ),
                //             )),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 32 + 8),
                Container(
                    child: GestureDetector(
                  //action navigate to sign in screen
                  onTap: () {
                    sendOtpEmail();
                    // Navigator.of(context).pop();
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
                        "Xác thực",
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
                  //action navigate to sign in screen
                  onTap: () {
                    resetPasswordUser(widget.email, context);
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 42,
                      width: 200,
                      decoration: BoxDecoration(
                        color: transparent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                            color: black1,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )),
                )),
              ],
            ),
          ),
        ));
  }

  //Create function
  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      isHiddenConfirmPassword = !isHiddenConfirmPassword;
    });
  }
}
