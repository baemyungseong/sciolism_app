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


class termCondition extends StatefulWidget {
  const termCondition({Key? key}) : super(key: key);

  @override
  _termConditionState createState() => _termConditionState();
}

class _termConditionState extends State<termCondition> {
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
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(authenticationGeneralBackground), fit: BoxFit.cover),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 32),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          
                        ],
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 32),
                    child: Column(
                      children: [

                      ],
                    )
                  )
                ],
              ),
            ],
          )
        )
    );
  }
}