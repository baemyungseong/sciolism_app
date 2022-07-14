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

class onboardingScreen1 extends StatelessWidget {
  const onboardingScreen1({Key? key}) : super(key: key);

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
          margin: EdgeInsets.only(top: 48 + 32, left: 24, right: 24),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(createRoute("authentication"));
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
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
              SizedBox(height: 64),
              Container(
                height: 222,
                width: 329,
                alignment: Alignment.center,
                child: Image.asset(imageOnboarding1, scale: 1),
              ),
              SizedBox(height: 78),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                      width: 393 - 48,
                      child: Text(
                        'Học tất cả mọi thứ.' +
                            '\n' +
                            'Một không gian duy nhất.',
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
                        'Nâng cao khả năng học thức của bạn, giúp hoàn thiện bản thân hơn. Sciolism là một cách mới để học mọi thứ theo cách của bạn!',
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
