//import constaint
import 'package:sciolism_app/constants/colors.dart';
import 'package:sciolism_app/constants/images.dart';

//import route
import 'package:sciolism_app/screens/route/route.dart';

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --------

class onboardingScreen3 extends StatelessWidget {
  const onboardingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Change status bar color to white
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: transparent),
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 48 + 56, left: 0, right: 0),
          child: Column(
            children: [
              Container(
                height: 327,
                width: 393,
                alignment: Alignment.center,
                child: Image.asset(imageOnboarding3, scale: 1),
              ),
              SizedBox(height: 54),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.zero,
                      width: 393 - 48,
                      child: Text(
                        'Được nhiều doanh nhân' +
                            '\n' +
                            'thành đạt Thế Giới sử dụng.',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          height: 1.4,
                          letterSpacing: 0.2,
                          fontSize: 24,
                          color: black1,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      )),
                  SizedBox(height: 16),
                  Container(
                      width: 393 - 48,
                      child: Text(
                        'Tìm hiểu cách mà những doanh nhân thành đạt trên Thế Giới sử dụng Sciolism để học tập, làm việc nhằm phát triển bản thân.',
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
            ],
          ),
        ),
      ),
    );
  }
}
