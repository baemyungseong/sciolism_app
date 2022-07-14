//import navigations
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sciolism_app/screens/main_page.dart';
import 'package:sciolism_app/screens/authentication/signInScreen.dart';
import 'package:sciolism_app/screens/authentication/signUpScreen.dart';
import 'package:sciolism_app/screens/authentication/authenticationWrapper.dart';
import 'package:sciolism_app/screens/authentication/forgotPassword.dart';
import 'package:sciolism_app/screens/authentication/instructionManual.dart';
import 'package:sciolism_app/screens/authentication/verificationOTPCode.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen1.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen2.dart';
import 'package:sciolism_app/screens/onboarding/onboardingScreen3.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

//import others
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sciolism_app/screens/profile/termCondition.dart';

// --------
User? user = auth.FirebaseAuth.instance.currentUser;

Route createRoute(nameRoute) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (nameRoute) {
        case "authentication":
          return authenticationWrapper();

        case "signIn":
          return signInScreen();

        case "signUp":
          return signUpScreen();

        case "instruction":
          return instructionManual();
        case "terms":
          return termCondition();
        case "main":
          return MainPage(
            uid: user!.uid.toString(),
          );
      }
      return nameRoute;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
