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

class onboardingScreen2 extends StatelessWidget {
  const onboardingScreen2({Key? key}) : super(key: key);

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
          margin: EdgeInsets.only(top: 48 + 32, left: 0, right: 0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(createRoute("authentication"));
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.only(right: 24),
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: grey2,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.forward,
                      size: 24,
                      color: black1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Container(
                height: 327,
                width: 393,
                alignment: Alignment.center,
                child: Image.asset(imageOnboarding2, scale: 1),
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.zero,
                      width: 393 - 48,
                      child: Text(
                        'Trao đổi mọi thứ về học tập' +
                            '\n' +
                            'tuyệt vời hơn bao giờ hết!',
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
                        'Nói lời tạm biệt với sự cô đơn khi giờ đây bạn có thể vừa học tập vừa trao đổi kiến thức, tầm hiểu biết của mình với những người khác.',
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
