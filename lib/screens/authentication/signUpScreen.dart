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
import 'package:flutter/gestures.dart';
import 'package:sciolism_app/screens/widgets/snackBarWidget.dart';

// --------

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  TextEditingController OTPCodeController = TextEditingController();
  final GlobalKey<FormState> OTPCodeFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> confirmPasswordFormKey = GlobalKey<FormState>();

  late EmailAuth emailAuth;
  bool submitValid = false;

  void sendOtpEmail() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: emailController.value.text, otpLength: 4);
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
    super.initState();
    emailAuth = new EmailAuth(
      sessionName: "Sciolism Application",
    );
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
                  image: AssetImage(signUpBackground), fit: BoxFit.cover),
            ),
            padding: EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                Spacer(),
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
                              'Đăng ký',
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
                  ],
                ),
                SizedBox(height: 32),
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
                      SizedBox(height: 28),
                      Text(
                        'Mã xác thực OTP',
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
                        key: OTPCodeFormKey,
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
                              controller: OTPCodeController,
                              keyboardType: TextInputType.number,
                              autofillHints: [AutofillHints.oneTimeCode],
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                // height: 1.4,
                                letterSpacing: 0.2,
                                fontSize: 12,
                                color: black1,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      showSnackBar(
                                          context,
                                          'Please check your email!',
                                          'success');
                                      sendOtpEmail();
                                    },
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 16, right: 16),
                                            child: Text(
                                              'Lấy mã',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                // height: 1.4,
                                                letterSpacing: 0.2,
                                                fontSize: 12,
                                                color: black1,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          )
                                        ])),
                                contentPadding:
                                    EdgeInsets.only(left: 16, right: 0),
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  // height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 12,
                                  color: grey1.withOpacity(0.64),
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: "Nhập mã OTP của bạn",
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
                      SizedBox(height: 28),
                      Text(
                        'Mật khẩu',
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
                        key: passwordFormKey,
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
                              controller: passwordController,
                              obscureText: isHiddenPassword,
                              keyboardType: TextInputType.visiblePassword,
                              autofillHints: [AutofillHints.password],
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                // height: 1.4,
                                letterSpacing: 0.2,
                                fontSize: 12,
                                color: black1,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: isHiddenPassword
                                        ? Stack(
                                            alignment: Alignment.center,
                                            children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16, right: 16),
                                                    child: Icon(Iconsax.eye,
                                                        size: 20,
                                                        color: black1))
                                              ])
                                        : Stack(
                                            alignment: Alignment.center,
                                            children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16, right: 16),
                                                    child: Icon(
                                                        Iconsax.eye_slash,
                                                        size: 20,
                                                        color: grey1
                                                            .withOpacity(0.64)))
                                              ])),
                                contentPadding:
                                    EdgeInsets.only(left: 16, right: 0),
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  // height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 12,
                                  color: grey1.withOpacity(0.64),
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: "Nhập mật khẩu của bạn",
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
                      SizedBox(height: 28),
                      Text(
                        'Xác nhận mật khẩu',
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
                        key: confirmPasswordFormKey,
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
                              controller: confirmPasswordController,
                              obscureText: isHiddenConfirmPassword,
                              keyboardType: TextInputType.visiblePassword,
                              autofillHints: [AutofillHints.password],
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                // height: 1.4,
                                letterSpacing: 0.2,
                                fontSize: 12,
                                color: black1,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: _toggleConfirmPasswordView,
                                    child: isHiddenConfirmPassword
                                        ? Stack(
                                            alignment: Alignment.center,
                                            children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16, right: 16),
                                                    child: Icon(Iconsax.eye,
                                                        size: 20,
                                                        color: black1))
                                              ])
                                        : Stack(
                                            alignment: Alignment.center,
                                            children: [
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        left: 16, right: 16),
                                                    child: Icon(
                                                        Iconsax.eye_slash,
                                                        size: 20,
                                                        color: grey1
                                                            .withOpacity(0.64)))
                                              ])),
                                contentPadding:
                                    EdgeInsets.only(left: 16, right: 0),
                                hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  // height: 1.4,
                                  letterSpacing: 0.2,
                                  fontSize: 12,
                                  color: grey1.withOpacity(0.64),
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText: "Xác nhận lại mật khẩu của bạn",
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
                SizedBox(height: 32 + 8),
                Container(
                    child: GestureDetector(
                  onTap: () {
                    if (confirmPasswordController.text !=
                        passwordController.text) {
                      showSnackBar(
                          context, 'Confirm Password Is Wrong', 'error');
                    } else {
                      if (emailAuth.validateOtp(
                              recipientMail: emailController.value.text,
                              userOtp: OTPCodeController.value.text) ==
                          true) {
                        registerUser(emailController.text,
                            passwordController.text, context);
                      }
                    }
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
                        "Đăng ký",
                        style: TextStyle(
                            color: white2,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )),
                )),
                SizedBox(height: 32),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Bạn đã có tài khoản? ',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      // height: 1.4,
                      letterSpacing: 0.2,
                      fontSize: 12,
                      color: black1,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      child: GestureDetector(
                    //action navigate to sign up screen
                    onTap: () {
                      Navigator.of(context).push(createRoute("signIn"));
                    },
                    child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        child: Text(
                          "Đăng nhập ngay!",
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
                ]),
                SizedBox(height: 24),
                Container(
                  width: 393 - 48 - 68,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          height: 1.6,
                          letterSpacing: 0.2,
                          fontSize: 10,
                          color: grey1.withOpacity(0.64),
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text:
                              'Bằng cách ấn nút Đăng ký, đồng nghĩa việc rằng bạn đã chấp thuận các',
                        ),
                        TextSpan(
                          text: ' Điều khoản Sử dụng ',
                          style: TextStyle(
                            color: black1,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(createRoute("terms"));
                            },
                        ),
                        TextSpan(
                          text: 'của chúng tôi.',
                        ),
                      ],
                    ),
                  ),
                ),
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
