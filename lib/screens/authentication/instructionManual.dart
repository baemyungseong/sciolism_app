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


class instructionManual extends StatefulWidget {
  const instructionManual({Key? key}) : super(key: key);

  @override
  _instructionManualState createState() => _instructionManualState();
}

class _instructionManualState extends State<instructionManual> {
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
                            'Hướng dẫn',
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
                      )
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 393 - 48,
                      child: Text(
                        'Nếu bạn đang băn khoăn không biết làm sao để lấy lại mật khẩu, hãy cùng chúng tôi hoàn thành theo thứ tự từng bước sau đây:',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            height: 1.6,
                            letterSpacing: 0.2,
                            fontSize: 14,
                            color: grey1,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.justify,
                      )
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: Divider(
                    height: 4,
                    thickness: 0.5,
                    indent: 0,
                    endIndent: 0,
                    color: grey1,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 393 - 48,
                  child: Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            height: 1.6,
                            letterSpacing: 0.2,
                            fontSize: 14,
                            color: grey1,
                            fontWeight: FontWeight.w400
                          ),
                          children: [
                            TextSpan(
                              text: 'Bước 1: ',
                              style: TextStyle(
                                color: black1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' Nhập tài khoản Email đã đăng ký cần lấy lại mật khẩu.',
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 12),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      height: 1.6,
                      letterSpacing: 0.2,
                      fontSize: 14,
                      color: grey1,
                      fontWeight: FontWeight.w400
                    ),
                    children: [
                      TextSpan(
                        text: 'Bước 2: ',
                        style: TextStyle(
                          color: black1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Nhấn nút “Lấy lại mật khẩu” hiển thị bên dưới ô nhập.',
                      ),
                    ],
                  ),
                ),	  
                SizedBox(height: 12),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      height: 1.6,
                      letterSpacing: 0.2,
                      fontSize: 14,
                      color: grey1,
                      fontWeight: FontWeight.w400
                    ),
                    children: [
                      TextSpan(
                        text: 'Bước 3: ',
                        style: TextStyle(
                          color: black1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Truy cập vào địa chỉ Email đã nhập, kiểm tra mã OTP đã được chúng tôi gửi qua địa chỉ Email đó để lấy lại mật khẩu! Hãy chắc rằng bạn đã tìm thấy ở mục tất cả thư bao gồm cả thư rác.',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      height: 1.6,
                      letterSpacing: 0.2,
                      fontSize: 14,
                      color: grey1,
                      fontWeight: FontWeight.w400
                    ),
                    children: [
                      TextSpan(
                        text: 'Bước 4: ',
                        style: TextStyle(
                          color: black1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Nhập mã OTP, mật khẩu mới kèm xác nhận lại mật khẩu mới, hoàn tất quá trình lấy lại mật khẩu cho tài khoản Email của bạn!',
                      ),
                    ],
                  ),
                ),
              ]
            )
                ),
                SizedBox(height: 32),
                Container(
                    child: GestureDetector(
                  //action navigate to sign in screen
                  onTap: () {
                    print("luc lam thi xoa dong nay nha bà Nhất!");
                    Navigator.of(context).push(createRoute("main"));
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
                        "Đã hiểu",
                        style: TextStyle(
                            color: white2,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )),
                )),
                SizedBox(height: 32),
		            Container(
                  width: 393 - 48 - 68,
                  child: Text(
                    'Nếu có bất kì câu hỏi hay vấn đề nào khác, vui lòng gửi email cho chúng tôi tại',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        height: 1.6,
                        letterSpacing: 0.2,
                        fontSize: 10,
                        color: grey1.withOpacity(0.64),
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                        "helpSciolism@gmail.com",
                        style: TextStyle(
                            color: black1,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )
              ],
            ),
          ),
        )
    );
  }
}