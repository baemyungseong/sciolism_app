//import constaint
import 'package:sciolism_app/api/firebase_api.dart';
import 'package:sciolism_app/constants/colors.dart';
import 'package:sciolism_app/constants/images.dart';
import 'package:sciolism_app/screens/authentication/forgotPassword.dart';

//import route
import 'package:sciolism_app/screens/route/route.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/services.dart';

// --------

class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  _signInScreenState createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

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
                  image: AssetImage(signInBackground), fit: BoxFit.cover),
            ),
            padding: EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 40),
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
                              'Đăng nhập',
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
                          'Chỉ một bước nữa để có thể thưởng thức không gian học tập dành riêng cho chính bạn!',
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
                SizedBox(height: 40 + 16),
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
                      SizedBox(height: 28 + 8),
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
                    ],
                  ),
                ),
                SizedBox(height: 24 + 8),
                Container(
                    child: GestureDetector(
                  //action navigate to sign up screen
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => forgotPasswordScreen())));
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.centerRight,
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                            color: black1,
                            fontFamily: 'Roboto',
                            // height: 1.4,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        textAlign: TextAlign.right,
                      )),
                )),
                SizedBox(height: 32 + 8),
                Container(
                    child: GestureDetector(
                  //action navigate to sign in screen
                  onTap: () {
                    signIn(
                        emailController.text, passwordController.text, context);
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Container(
                //         padding: EdgeInsets.symmetric(horizontal: 20),
                //         child: GestureDetector(
                //           //action navigate to sign in with facebook screen
                //           onTap: () {
                //             print("luc lam thi xoa dong nay nha bà Nhất!");
                //           },
                //           child: AnimatedContainer(
                //             width: 24,
                //             height: 24,
                //             alignment: Alignment.center,
                //             duration: Duration(milliseconds: 300),
                //             child: Image.asset(facebookIcon, scale: 1),
                //           ),
                //         )),
                //     Container(
                //         padding: EdgeInsets.symmetric(horizontal: 20),
                //         child: GestureDetector(
                //           //action navigate to sign in with twitter screen
                //           onTap: () {
                //             print("luc lam thi xoa dong nay nha bà Nhất!");
                //           },
                //           child: AnimatedContainer(
                //             width: 24,
                //             height: 24,
                //             alignment: Alignment.center,
                //             duration: Duration(milliseconds: 300),
                //             child: Image.asset(twitterIcon, scale: 1),
                //           ),
                //         )),
                //     Container(
                //         padding: EdgeInsets.symmetric(horizontal: 20),
                //         child: GestureDetector(
                //           //action navigate to sign in with google screen
                //           onTap: () {
                //             print("luc lam thi xoa dong nay nha bà Nhất!");
                //           },
                //           child: AnimatedContainer(
                //             width: 24,
                //             height: 24,
                //             alignment: Alignment.center,
                //             duration: Duration(milliseconds: 300),
                //             child: Image.asset(googleIcon, scale: 1),
                //           ),
                //         )),
                //   ],
                // )
                SizedBox(height: 40),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Chưa có tài khoản? ',
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
                      Navigator.of(context).push(createRoute("signUp"));
                    },
                    child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        child: Text(
                          "Đăng ký ngay!",
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
                ])
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
}
